import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/cart_repos/cart_product_repo/cart_product_repo.dart';
import 'package:hezma/Data/models/cart_models/cart_product/datum.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProductRepoImpl implements CartProductRepo {
  final ApiService apiService;

  CartProductRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CartProductModel>>> fetchCartProducts() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var t = pref.getString(sharedToken);
      var result = await apiService.get(url: '${baseURL}cart', token: t);
      if (result['data'] != null && result['data'] is List) {
        List<CartProductModel> cartProducts = [];
        for (var item in result['data']) {
          cartProducts.add(CartProductModel.fromJson(item));
        }
        return right(cartProducts);
      } else {
        return left(ServerFailure('Unexpected data format'));
      }
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCartProducts(
      {required int cartId, required int id, required String count}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var t = pref.getString(sharedToken);
      Map<String, dynamic> body = {
        'product_id': id,
        'count': count,
      };
      var result = await apiService.post(
          url: '${baseURL}cart/delete-product/$cartId', token: t, body: body);
      String msg = result['message'];
      return right(msg);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCountProduct(
      {required int cartid, required int count}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var t = pref.getString(sharedToken);

      Map<String, dynamic> body = {
        'count': count,
      };
      var result = await apiService.post(
          url: '${baseURL}cart/update-count/$cartid', token: t, body: body);
      return right(result['message']);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addCartProduct(
      {required int productId,
      required String count,
      required String price}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var t = pref.getString(sharedToken);
    int totalPrice = 0;
    int c = int.parse(count);
    int p = int.parse(price);
    totalPrice = c * p;
    Map<String, dynamic> data = {
      "product_id": productId,
      "count": count.toString(),
      "total_price": totalPrice.toString(),
      "details": [
        {
          "main_sector_id": "3",
          "sector_type_id": "4",
          "name": "sdgsgsdgsd",
          "price": "10"
        },
        {
          "main_sector_id": "3",
          "sector_type_id": "4",
          "name": "sdgsgsdgsd",
          "price": "10"
        },
        {
          "main_sector_id": "3",
          "sector_type_id": "4",
          "name": "sdgsgsdgsd",
          "price": "100"
        }
      ]
    };
    try {
      var result = await apiService.post(
          url: '${baseURL}cart/add-product', token: t, body: data);
      return right(result['message']);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
