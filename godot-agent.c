#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "deps/libuv/include/uv.h"

#ifdef __sun
#include <sys/pset.h>
#include <sys/loadavg.h>
#endif

#define DEBUG 1

static uv_loop_t *loop;
static uv_connect_t connect_req;
static uv_tcp_t client;
static uv_write_t write_req;
static char hostname[512];

char* make_json(char *name, char *state, double value) {
  char *json_buf;
  /* We PROBABLY won't ever need to send more than 1kb of JSON at one time. */
  /* TODO: Revisit this decision. */
  json_buf = malloc(sizeof(char) * 1024);
  snprintf(json_buf, 1024, 
      "{"
      "\"Host\": \"%s\","
      "\"Service\": \"%s\","
      "\"State\": \"%s\","
      "\"Time\": \"%llu\","
      "\"Metric\": \"%f\","
      "\"TTL\": \"15\""
      "}\n", hostname, name, state, uv_hrtime(), value);
  return json_buf;
}

void after_write(uv_write_t *req, int status) {
  if (status) {
    fprintf(stderr, "uv_write error: %s\n", uv_strerror(uv_last_error(loop)));
  } 
}

void send_data(char *name, char *state, double value) {
  int r;
  uv_buf_t send_buf;
  uv_stream_t *stream;
  char *json_data = make_json(name, state, value);

  send_buf = uv_buf_init(json_data, sizeof(char) * strlen(json_data));

  stream = connect_req.handle;

  r = uv_write(&write_req, stream, &send_buf, 1, after_write);
  if (r) {
    fprintf(stderr, "uv_write: %s\n", uv_strerror(uv_last_error(loop)));
    return;
  }
  free(json_data);
}

void send_heartbeat(uv_timer_t *timer, int status) {
  send_data("heartbeat", "info", 0);
}

void send_cpu_usage(uv_timer_t *timer, int status) {
  double loadinfo[3];
#ifdef __sun
  /* On SunOS, if we're not in a global zone, uv_loadavg returns [0, 0, 0] */
  /* This, instead, gets the loadavg for our assigned processor set. */
  pset_getloadavg(PS_MYID, loadinfo, 3);
#else
  uv_loadavg(loadinfo);
#endif
  send_data("CPU load, last minute", "info", loadinfo[0]);
  send_data("CPU load, last 5 minutes", "info", loadinfo[1]);
  send_data("CPU load, last 15 minutes", "info", loadinfo[2]);
}

void send_mem_usage(uv_timer_t *timer, int status) {
  double mempct;
  uint64_t freemem = uv_get_free_memory();
  uint64_t totalmem = uv_get_total_memory();

  mempct = (double)(totalmem - freemem) / (double)totalmem;
  send_data("Memory Usage (%)", "info", mempct);
}

void on_connect(uv_connect_t *req, int status) {
  if (status) {
    fprintf(stderr, "on_connect: %s\n", uv_strerror(uv_last_error(loop)));
    return;
  }
#ifdef DEBUG
  printf("Successfully connected!\n");
#endif
}

int main(int argc, char *argv[]) {
  uv_timer_t heartbeat;
  uv_timer_t mem_timer;
  uv_timer_t cpu_timer;

  loop = uv_default_loop();
  /* Get the hostname so that it can be provided to the server */
  gethostname(hostname, sizeof(hostname));

  /* Set up a TCP keepalive connection to the godot server */
  /* TODO: make the host and port more easily configurable */
  struct sockaddr_in addr = uv_ip4_addr("127.0.0.1", 1337);
  uv_tcp_init(loop, &client);
  uv_tcp_keepalive(&client, 1, 180);
  uv_tcp_connect(&connect_req, &client, addr, on_connect);

  /* Setup timers for heartbeat and resource reporting */
  uv_timer_init(loop, &heartbeat);
  uv_timer_init(loop, &mem_timer);
  uv_timer_init(loop, &cpu_timer);

  uv_timer_start(&heartbeat, send_heartbeat, 60000, 60000);
  uv_timer_start(&mem_timer, send_mem_usage, 5000, 5000);
  uv_timer_start(&cpu_timer, send_cpu_usage, 15000, 15000);

  uv_run(loop);
  return 0;
}
