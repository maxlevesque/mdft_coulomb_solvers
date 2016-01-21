program test1

  use mdft_coulomb_solvers, only: solve_coulomb

  implicit none

  integer, parameter :: Nsource = 10  ! number of source charges
  double precision :: source_coo(3,Nsource) ! coordinates of sources
  double precision :: source_charge(Nsource) ! the charge of each source in electron units
  integer, parameter :: Ntarget = 100
  double precision :: target_coo(3,Ntarget) ! target coordinates
  double precision :: target_electric_field(Ntarget) ! what we are looking for : the electric field at target coordinates
  integer, parameter :: method=0 ! 0 for direct sum

  integer :: isource, itarget

  !
  ! Coordinates of the sources
  !
  do isource = 1, Nsource
    call random_number( source_coo(:,isource) ) ! random_number generates numbers between 0 and 1
  end do
  source_coo = source_coo * 100               ! random numbers between 0 and 100

  !
  ! Charges of the sources
  !
  do isource = 1, Nsource
    call random_number( source_charge ) ! between 0 and 1
  end do

  !
  ! Target coordinates : where I want to know the electric potential
  !
  do itarget = 1, Ntarget
    call random_number( target_coo(:,itarget) )
  end do
  target_coo = target_coo * 100



  !
  ! Our module library
  !
  call solve_coulomb ( Nsource, source_coo, source_charge, Ntarget, target_coo, target_electric_field, method )

end program test1
