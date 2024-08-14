part of 'home_product_cubit.dart';

sealed class HomeProductState {}

final class HomeProductInitial extends HomeProductState {}
final class HomeProductLoading extends HomeProductState {}
final class HomeProductSuccess extends HomeProductState {
  final List<Product> porducts;

  HomeProductSuccess(this.porducts); 
}
final class HomeProductFailure extends HomeProductState {
  final String errMsg;

  HomeProductFailure(this.errMsg);

}
