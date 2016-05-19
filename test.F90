program hello
  use xxx
  use iso_c_binding
  implicit none

  include 'mpif.h'

  integer :: ierr, comm_rank, comm_size
  type(c_ptr) :: x_ptr
  real(c_double), allocatable, target :: vec(:)
  integer(c_size_t) :: n
  character(len=32) :: options

  call MPI_INIT(ierr)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, comm_size, ierr)
  call MPI_COMM_RANK(MPI_COMM_WORLD, comm_rank, ierr)
  n = 2
  allocate(vec(n))
  vec(1) = 3.14
  vec(2) = 1.41
  options = '{ "name": "dummy", "age": 24 }'//c_null_char
  x_ptr = XXX_create(MPI_COMM_WORLD, c_loc(vec), n, white, options)
  call XXX_apply(x_ptr, c_loc(vec), n)
  call XXX_apply(x_ptr, c_loc(vec), n)
  call XXX_delete(x_ptr)
  deallocate(vec)
  call MPI_FINALIZE(ierr)

end program

