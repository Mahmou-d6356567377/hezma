part of 'pay_mothod_cubit.dart';

sealed class PayMothodState extends Equatable {
  const PayMothodState();

  @override
  List<Object> get props => [];
}

final class PayMothodInitial extends PayMothodState {}

final class PayMothodLoading extends PayMothodState {}

final class PayMothodFailure extends PayMothodState {
  final String errMsg;

  const PayMothodFailure(this.errMsg);
}

final class PayMothodSuccess extends PayMothodState {
  final List<PayDatum> payMethods;

  const PayMothodSuccess(this.payMethods);
}
