program hello
  use iso_c_binding
  implicit none

  enum, bind(C)
    enumerator :: white=1, black=2
  end enum

  interface
    type(c_ptr) function xxx_create(comm, vec, n, color, options) bind(C, name="XXX_create")
      use iso_c_binding, only: c_ptr, c_char, c_double, c_size_t, c_int
      implicit none
      integer :: comm
      integer(kind=c_int), value, intent(in) :: color
      type(c_ptr), value      :: vec
      integer(kind=c_size_t), value, intent(in) :: n
      character(kind=c_char) :: options(*)
    end function
    subroutine xxx_apply(x) bind(C, name="XXX_apply")
      use iso_c_binding, only: c_ptr
      implicit none
      type(c_ptr) :: x
    end subroutine
    subroutine xxx_delete(x) bind(C, name="XXX_delete")
      use iso_c_binding, only: c_ptr
      implicit none
      type(c_ptr) :: x
    end subroutine
  end interface

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
  call XXX_apply(x_ptr)
  call XXX_delete(x_ptr)
  deallocate(vec)
  call MPI_FINALIZE(ierr)

end program

