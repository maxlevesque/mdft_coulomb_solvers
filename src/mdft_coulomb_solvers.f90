module mdft_coulomb_solvers
  implicit none
  private
  public :: solve_coulomb
contains

  subroutine solve_coulomb ( Nsource, source_coo, source_charge, Ntarget, target_coo, target_electric_field, method )
    implicit none
    integer, intent(in) :: Nsource
    double precision, intent(in) :: source_coo(3,Nsource) ! coordinates of sources
    double precision, intent(in) :: source_charge(Nsource) ! the charge of each source in electron units
    integer, intent(in) :: Ntarget
    double precision, intent(in) :: target_coo(3,Ntarget) ! target coordinates
    double precision, intent(out) :: target_electric_field(Ntarget) ! what we are looking for : the electric field at target coordinates
    integer, intent(in) :: method ! 0 for direct sum
    integer :: itarget, isource

    !
    ! At this point the target_electric_field is unknown. Initialization:
    !
    target_electric_field = 0.d0

    select case (method)

    case (0) ! direct sum

      do itarget=1,Ntarget
        do isource=1,Nsource
          target_electric_field(itarget) = target_electric_field(itarget) + source_charge(isource) &
             / norm2(source_coo(:,isource) - target_coo(:,itarget))  ! electric_field(target) = sum_sources ( qsource/r)
        end do
      end do

    case default
      print*, "In module mdft_coulomb_solver, method", method," is not implemented"
      error stop "KLXZkbh7jdMpkj5Z"
    end select

  end subroutine solve_coulomb

end module mdft_coulomb_solvers
