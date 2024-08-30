part of 'category_products_cubit.dart';

sealed class CategoryProductsState extends Equatable {
  const CategoryProductsState();

  @override
  List<Object> get props => [];
}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsLoading extends CategoryProductsState {}

final class CategoryProductsFailure extends CategoryProductsState {
  final String errMsg;

  const CategoryProductsFailure(this.errMsg);
}

final class CategoryProductsSuccess extends CategoryProductsState {
  final List<Product> categoryProducts;

  const CategoryProductsSuccess(this.categoryProducts);
}
