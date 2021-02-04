#include <stdio.h>
#include <assert.h>

#include <uv.h>

static uv_thread_t thread;

static void thread_cb(void* arg) {
  printf("Hello thread!\n");
}

int main(int argc, char *argv[])
{
  int r = uv_thread_create(&thread, thread_cb, NULL);
  assert(r == 0);

  uv_thread_join(&thread);


  return 0;
}
