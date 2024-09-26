part of 'varify_coupon_cubit.dart';

sealed class VarifyCouponState extends Equatable {
  const VarifyCouponState();

  @override
  List<Object> get props => [];
}

final class VarifyCouponInitial extends VarifyCouponState {}

final class VarifyCouponLoading extends VarifyCouponState {}

final class VarifyCouponFailure extends VarifyCouponState {
  final String errMsg;

  const VarifyCouponFailure(this.errMsg);
}

final class VarifyCouponSuccess extends VarifyCouponState {
  final String succmsg;

  const VarifyCouponSuccess(this.succmsg);
}
