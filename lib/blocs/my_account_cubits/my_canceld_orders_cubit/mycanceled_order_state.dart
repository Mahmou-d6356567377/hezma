part of 'mycanceled_order_cubit.dart';

sealed class MycanceledOrderState extends Equatable {
  const MycanceledOrderState();

  @override
  List<Object> get props => [];
}

final class MycanceledOrderInitial extends MycanceledOrderState {}
final class MycanceledOrderLoading extends MycanceledOrderState {}
final class MycanceledOrderFailure extends MycanceledOrderState {
  final String errMsg;

  const MycanceledOrderFailure(this.errMsg);
}
final class MycanceledOrderSuccess extends MycanceledOrderState {
  final List<OrderData> myCanceledOrders;

  const MycanceledOrderSuccess(this.myCanceledOrders);
}
