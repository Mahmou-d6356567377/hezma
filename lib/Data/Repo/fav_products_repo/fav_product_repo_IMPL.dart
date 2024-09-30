import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/fav_products_repo/fav_product_repo.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavProductRepoImpl implements FavoriteProductRepo {
  final ApiService apiService;
   Future<String?> _getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token1 = pref.getString(sharedToken);
    final String? token2 = pref.getString(sharedregisterToken);

    if (token1 != null) {
      return token1;
    } else if (token2 != null) {
      return token2;
    } else {
      return null;
    }
  }
  FavProductRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Product>>> fetchFavProducts() async {
    try {
      String? token = await _getToken();
      if (token ==null) {
        return left(ServerFailure('Token is null'));
      }
      var result =
          await apiService.get(url: '${baseURL}favorites', token: token);
      List<Product> favProduct = [];
      for (var item in result['data']) {
        favProduct.add(Product.fromJson(item));
      }

      return right(favProduct);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> addFavProducts(Product productModel) async {
    try {
      String? token = await _getToken();
      await apiService.post(
          url: '${baseURL}favorites/${productModel.id}',
          token: token,
          body: null);
    } catch (e) {
      Text('error in add favorite product $e');
    }
  }

  @override
  Future<void> removeFavProducts(Product productModel) async {
    try {
      String? token = await  _getToken();
      await apiService.del(
          url: '${baseURL}favorites/${productModel.id}', token: token);
    } catch (e) {
      Text('error in remove favorite product $e');
    }
  }
}
