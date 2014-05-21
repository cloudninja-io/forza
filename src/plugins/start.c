#include <env.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <uv.h>
#include <forza.h>

#define PATHMAX 1024

static char* buffer = NULL;
static size_t buffer_len = 0;
static int started = 0;
static int retried = 0;

static uv_timer_t timeout_timer;

static uv_loop_t* loop;
static char* lib_path;

static uv_fs_t log_file;
static uv_file log_file_fd;

void start__on_log_file_write(uv_fs_t* req) {
  //
  // Remark: shouldnt this be cleaned up as well?
  //
  uv_fs_req_cleanup(req);
  uv_fs_close(loop, &log_file, log_file_fd, NULL);
  uv_fs_req_cleanup(&log_file);

  log_file_fd = -1;
}

void start__send_and_write(forza_metric_t* metric) {
  char* json;
  uv_loop_t* loop = uv_default_loop();

  metric->time = time(NULL);

  if (log_file_fd != -1) {
    json = forza_json_stringify(metric);
    uv_fs_write(
      loop,
      &log_file,
      log_file_fd,
      json,
      strlen(json),
      0,
      start__on_log_file_write
    );
  }

  forza_send(metric);
}

void start__on_ipc_data(char* data) {
  unsigned short port;
  forza_metric_t* metric;

  if (sscanf(data, "port=%hu\n", &port) == 1) {
    uv_timer_stop(&timeout_timer);
    started = 1;

    metric = forza_new_metric();
    metric->metric = 1.0;
    metric->service = "health/process/start";
    metric->meta->port = port;

    start__send_and_write(metric);

    forza_free_metric(metric);
  }
}

void start__process_options_cb(uv_process_options_t* options) {
#if (__APPLE__ && __MACH__)
  options->env = env_set(options->env, "DYLD_FORCE_FLAT_NAMESPACE", "1");
  options->env = env_set(options->env, "DYLD_INSERT_LIBRARIES", lib_path);
#else
  options->env = env_set(options->env, "LD_PRELOAD", lib_path);
#endif
}

void start__failure() {
  forza_metric_t* metric = forza_new_metric();
  metric->service = "health/process/start";
  metric->metric = 0.0;
  metric->description = buffer;
  start__send_and_write(metric);
  forza_free_metric(metric);
}

//
// Lets add one retry and see what happens
//
void start__timeout(uv_timer_t* timer, int status) {
  if (!started && !retried) {
    retried = 1;
    uv_timer_start(&timeout_timer, start__timeout, 1500, 0);
  }
  else if (!started && retried) {
    start__failure();
  }
}

void start__on_data(char* data) {
  size_t len = strlen(data);

  buffer_len += len;
  buffer = realloc(buffer, buffer_len + 1);
  strncat(buffer, data, len);
}

void start__process_spawned_cb(uv_process_t* process, uv_process_options_t* options) {
  uv_timer_init(uv_default_loop(), &timeout_timer);
  uv_timer_start(&timeout_timer, start__timeout, 15000, 0);
}

void start__process_exit_cb(int exit_status, int term_signal) {
  if (!started) {
    uv_timer_stop(&timeout_timer);
    start__failure();
  }
}

int start_init(forza_plugin_t* plugin) {
  char* log_file_path;
  size_t size = PATHMAX / sizeof(*lib_path);

  lib_path = malloc(size);

  loop = uv_default_loop();

  if (uv_exepath(lib_path, &size) != 0) {
    fprintf(stderr, "uv_exepath: %s\n", uv_strerror(uv_last_error(loop)));
    return 1;
  }

#if (__APPLE__ && __MACH__)
  strcpy(strrchr(lib_path, '/') + 1, "libinterposed.dylib");
#else
  strcpy(strrchr(lib_path, '/') + 1, "libinterposed.so");
#endif

  log_file_path = saneopt_get(plugin->saneopt, "start-log");

  if (log_file_path != NULL) {
    log_file_fd = uv_fs_open(
      loop,
      &log_file,
      log_file_path,
      O_WRONLY | O_CREAT | O_TRUNC,
      S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH,
      NULL
    );

    if (log_file_fd == -1) {
      return -1;
    }
  }
  else {
    log_file_fd = -1;
  }

  plugin->process_options_cb = start__process_options_cb;
  plugin->ipc_data_cb = start__on_ipc_data;
  plugin->process_spawned_cb = start__process_spawned_cb;
  plugin->process_exit_cb = start__process_exit_cb;
  plugin->stdout_data_cb = start__on_data;
  plugin->stderr_data_cb = start__on_data;

  buffer = malloc(sizeof(char) * 1);
  buffer[0] = '\0';

  return 0;
}
