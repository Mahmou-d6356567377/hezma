part of 'make_order_cubit.dart';

sealed class MakeOrderState extends Equatable {
  const MakeOrderState();

  @override
  List<Object> get props => [];
}

final class MakeOrderInitial extends MakeOrderState {}

final class MakeOrderLoading extends MakeOrderState {}

final class MakeOrderFailure extends MakeOrderState {
  final String errMsg;

  const MakeOrderFailure(this.errMsg);
}

final class MakeOrderSuccess extends MakeOrderState {
  final String sucMsg;

  const MakeOrderSuccess(this.sucMsg);
}
