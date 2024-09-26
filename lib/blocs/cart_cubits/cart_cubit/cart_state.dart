part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartProductModel> cartProducts;
  final double totalPrice;

  const CartSuccess({required this.cartProducts, required this.totalPrice});
}

final class CartFailure extends CartState {
  final String errorMSG;

  const CartFailure(this.errorMSG);
}
