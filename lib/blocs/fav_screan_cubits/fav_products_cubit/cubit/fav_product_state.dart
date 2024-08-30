part of 'fav_product_cubit.dart';

sealed class FavProductState {}

final class FavProductInitial extends FavProductState {}

final class FavProductLoading extends FavProductState {}

final class FavProductSuccess extends FavProductState {
  final List<Product> favProducts;

  FavProductSuccess(this.favProducts);
}

final class FavProductFailure extends FavProductState {
  final String errMsg;

  FavProductFailure(this.errMsg);
}
