# mdft_coulomb_solvers

A simple fortran module with my coulomb solvers.

Maybe, this will one day become something important. For now, it is just a way to outsource the coulomb solver(s) we use in MDFT.

Provide it :
- source coordinates
- source charges
- target coordinates
- system size (optional for methods implying periodic boundary conditions)

It will return :
- the electric potential at target coordinates


Methods supported for now :
- direct sum = qq'/r
- pure lattice sum with periodic boundary conditions


```fortran
program test1
  use mdft_coulomb_solvers, only: solve_coulomb
  implicit none
  integer, parameter :: Nsource =  ! number of source charges
  double precision :: source_charges(Nsource)
  double precision :
  call XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end program test1
```
