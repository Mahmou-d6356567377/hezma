part of 'order_details_cubit.dart';

sealed class OrderDetailsState extends Equatable {
  const OrderDetailsState();

  @override
  List<Object> get props => [];
}

final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsLoading extends OrderDetailsState {}

final class OrderDetailsISuccess extends OrderDetailsState {
  final OrderProductModel orderData;

  const OrderDetailsISuccess(this.orderData);
}

final class OrderDetailsFailure extends OrderDetailsState {
  final String errMsg;

  const OrderDetailsFailure(this.errMsg);
}
