part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<CartProductModel> cartProduct;

  const CartSuccess(this.cartProduct);
}

final class CartFailure extends CartState {
  final String errorMSG;

  const CartFailure(this.errorMSG);
}
