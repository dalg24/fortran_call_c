program hello
  use iso_c_binding
  implicit none
  interface
    subroutine print_c(string) bind(C, name="print_C")
      use iso_c_binding, only: c_char
      character(kind=c_char) :: string(*)
    end subroutine
    type(c_ptr) function xxx_create(vec, n, options) bind(C, name="XXX_create")
      use iso_c_binding, only: c_ptr, c_char, c_double, c_size_t
      implicit none
      real(kind=c_double), intent(in) :: vec(:)
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

  integer       :: i, retval
  real(kind=8)  :: r
  character(len=128) :: str1
  character(len=64)  :: str2
  character(len=32)  :: str3

  integer :: ierror, rank, size
  type(c_ptr) :: x_ptr
  real(c_double), allocatable :: vec(:)
  integer(c_size_t) :: n
  character(len=32) :: options

  !! Init variables
  !! retval will hold the value returned from the C function
  i=10
  retval = 0
  r = 10.99
  str1 = "Hello World"//char(0)  !! Null terminate the string in fortran. Dont forget to do this.
  str2 = ""//char(0)             !! Empty string
  str3 = "Howdy!!"               !! Lets try a non null-terminated string

  !! Call the C function
  call c_foo(i,r,str1,str2,str3,retval)

  !! Print retval returned from C
  print *, "In Fortran code .. Back from C function, received retval: ", retval

  call print_c(C_CHAR_"Hello World"//C_NULL_CHAR)

  call MPI_INIT(ierror)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
  call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
  write(*, 100) rank, size
  n = 2
  allocate(vec(n))
  vec(1) = 3.14
  vec(2) = 1.41
  options = '{ "name": "dummy", "age": 24 }'//char(0)
  x_ptr = XXX_create(vec, n, options)
  call XXX_apply(x_ptr)
  call XXX_delete(x_ptr)
  deallocate(vec)
  call MPI_FINALIZE(ierror)

  100 format('Hello World! I am rank ', I1, ' of size ', I1)

end program

