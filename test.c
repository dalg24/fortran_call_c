#include "stdio.h"

void* XXX_create()
{
  printf("XXX_create\n");
  return NULL;
}

void XXX_apply(void* x, int n)
{
  printf("XXX_apply\n");
}

void XXX_delete(void* x)
{
  printf("XXX_delete\n");
}
