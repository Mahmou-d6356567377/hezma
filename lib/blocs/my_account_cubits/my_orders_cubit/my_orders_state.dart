part of 'my_orders_cubit.dart';

sealed class MyOrdersState extends Equatable {
  const MyOrdersState();

  @override
  List<Object> get props => [];
}

final class MyOrdersInitial extends MyOrdersState {}

final class MyOrdersLoading extends MyOrdersState {}

final class MyOrdersSuccess extends MyOrdersState {
  final List<Product> myOrders;

  const MyOrdersSuccess(this.myOrders);
}

final class MyOrdersFailure extends MyOrdersState {
  final String errMsg;

  const MyOrdersFailure(this.errMsg);
}
