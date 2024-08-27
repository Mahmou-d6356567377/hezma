import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/fav_products_repo/fav_product_repo.dart';
import 'package:hezma/Data/models/home_products_model/product.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';

class FavProductRepoImpl implements FavoriteProductRepo {
  final ApiService apiService;
  FavProductRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Product>>> fetchFavProducts() async {
    try {
      var result =
          await apiService.get(url: '${baseURL}favorites', token: kToken);

      List<Product> favProduct = [];

      for (var item in result['data']) {
        favProduct.add(Product.fromJson(item));
      }

      return right(favProduct);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> addFavProducts(Product productModel) async {
    try {
      await apiService.post(
          url: '${baseURL}favorites/${productModel.id}',
          token: kToken,
          body: null);
    } catch (e) {
      Text('error in add favorite product $e');
    }
  }

  @override
  Future<void> removeFavProducts(Product productModel) async {
    try {
      await apiService.del(
          url: '${baseURL}favorites/${productModel.id}', token: kToken);
    } catch (e) {
      Text('error in remove favorite product $e');
    }
  }
}
