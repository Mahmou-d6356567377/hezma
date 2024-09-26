part of 'cart_access_cubit.dart';

sealed class CartAccessState extends Equatable {
  const CartAccessState();

  @override
  List<Object> get props => [];
}

final class CartAccessInitial extends CartAccessState {}

final class CartAccessLoading extends CartAccessState {}

final class CartAccessFailure extends CartAccessState {
  final String errMsg;

  const CartAccessFailure(this.errMsg);
}

final class CartAccessSuccess extends CartAccessState {
  final String succMsg;

  const CartAccessSuccess(this.succMsg);
}
