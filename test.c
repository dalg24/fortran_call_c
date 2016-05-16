#include "stdio.h"
#include <stdlib.h>
#include <string.h>

/*
 * The C interface to the Fortran function
 * Notice the trailing underscore in the function name
 * All variables are passed as pointers
 * String lengths are passed implicitly by the compiler and not as pointers
 */
void c_foo_(int *i, double *r, char *str1, char *str2, char *str3, int* retval, int str1_len, int str2_len, int str3_len) {
  puts("In C code ..");
  printf("i: %d, r: %f, str1: %s, str2: %s, str3: %s, len_str1: %d, len_str2: %d, len_str3: %d, strlen(str1): %d, strlen(str2): %d, strlen(str3): %d, retval: %d\n",
          *i, *r, str1, str2, str3, str1_len, str2_len, str3_len, strlen(str1), strlen(str2), strlen(str3), *retval);

  //Set return value to something
  *retval = 99;
}

void print_C(char *string) /* equivalent: char string[]  */
{
   printf("%s\n", string);
}

void* XXX_create(double const* vector, unsigned size, char const* options)
{
  printf("XXX_create\n");
  printf("vector=%p size=%d\n", vector, size);
  for (unsigned i = 0; i < size; ++i)
    printf("  %d %f\n", i, vector[i]);
  printf("options=%s\n", options);
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
