part of 'prev_orders_list_cubit.dart';

sealed class PrevOrdersListState extends Equatable {
  const PrevOrdersListState();

  @override
  List<Object> get props => [];
}

final class PrevOrdersListInitial extends PrevOrdersListState {}

final class PrevOrdersListLoading extends PrevOrdersListState {}

final class PrevOrdersListFailure extends PrevOrdersListState {
  final String errMsg;

  const PrevOrdersListFailure(this.errMsg);
}

final class PrevOrdersListSuccess extends PrevOrdersListState {
  final List<OrderData> myCanceledOrders;

  const PrevOrdersListSuccess(this.myCanceledOrders);
}
