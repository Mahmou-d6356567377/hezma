part of 'home_product_cubit.dart';

sealed class HomeProductState {}

final class HomeProductInitial1 extends HomeProductState {}

final class HomeProductLoading1 extends HomeProductState {}

final class HomeProductSuccess1 extends HomeProductState {
  final List<Product> porducts;

  HomeProductSuccess1(this.porducts);
}

final class HomeProductFailure1 extends HomeProductState {
  final String errMsg;

  HomeProductFailure1(this.errMsg);
}
