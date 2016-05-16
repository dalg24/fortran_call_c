#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

typedef enum { white=1, black=2 } XXX_Color;

void* XXX_create(MPI_Fint* fint, double const* vector, unsigned n, XXX_Color color, char const* options)
{
  MPI_Comm comm = MPI_Comm_f2c(*fint);
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
