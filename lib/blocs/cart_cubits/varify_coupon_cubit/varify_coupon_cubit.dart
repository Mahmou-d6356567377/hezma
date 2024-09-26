import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/cart_repos/varify_coupon_repo/varify_coupon_repo.dart';

part 'varify_coupon_state.dart';

class VarifyCouponCubit extends Cubit<VarifyCouponState> {
  VarifyCouponCubit(this.varifyCouponRepo) : super(VarifyCouponInitial());
  VarifyCouponRepo varifyCouponRepo;
  Future<void> varifyCouponCubitFun({required String coupon}) async {
    emit(VarifyCouponLoading());
    var result = await varifyCouponRepo.varifyCouponFun(coupon: coupon);
    result.fold((failure) {
      emit(VarifyCouponFailure(failure.errorMSG));
    }, (succmsg) {
      emit(VarifyCouponSuccess(succmsg));
    });
  }
}
