#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

typedef enum { white=1, black=2 } XXX_Color;

void* XXX_create(MPI_Fint fint, double const* vector, unsigned n, XXX_Color color, char const* options)
{
  MPI_Comm comm = MPI_Comm_f2c(fint);
  int rank, size;
  MPI_Comm_rank(comm, &rank);
  MPI_Comm_size(comm, &size);
  printf("Hello world from process %d of %d\n", rank, size);
  printf("XXX_create\n");
  printf("vector=%p size=%d\n", vector, n);
  for (unsigned i = 0; i < n; ++i)
    printf("  %d %f\n", i, vector[i]);
  if (color == white)
    printf("color=white\n");
  else if (color == black)
    printf("color=black\n");
  else
  {
    printf("invalid color!\n");
    abort();
  }
  printf("options=%s\n", options);
  void* x = malloc(sizeof(double));
  *(double*) x = 255;
  printf("x=%p\n", x);
  printf("x=%f\n", *(double*) x);
  return x;
}

void XXX_apply(void* x, double* vector, unsigned n)
{
  printf("XXX_apply\n");
  printf("vector=%p size=%d\n", vector, n);
  for (unsigned i = 0; i < n; ++i)
  {
    printf("  %d %f  ", i, vector[i]);
    vector[i] = -1;
    printf("->");
    printf("  %d %f\n", i, vector[i]);
  }
  printf("x=%p\n", x);
  printf("x=%f\n", *(double*) x);
}

void XXX_delete(void* x)
{
  printf("XXX_delete\n");
  printf("x=%p\n", x);
  printf("x=%f\n", *(double*) x);
  free(x);
}
