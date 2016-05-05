use, intrinsic :: iso_c_binding

interface
   subroutine XXX_apply(map, num), bind(C, name="XXX_apply")
      import :: c_ptr, c_int
      type(c_ptr), value :: map
      integer(c_int), value :: num
   end subroutine XXX_apply
end interface

program hello


end program
