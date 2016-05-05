
program hello
  implicit none


  integer       :: i, retval
  real(kind=8)  :: r
  character(len=128) :: str1
  character(len=64)  :: str2
  character(len=32)  :: str3

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

end program

