import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/cart_models/cart_product/datum.dart';

abstract class CartProductRepo {
  Future<Either<Failure, List<CartProductModel>>> fetchCartProducts();
  Future<Either<Failure, String>> addCartProduct(
      {required int productId, required String count, required String price});
  Future<Either<Failure, String>> deleteCartProducts(
      {required int cartId, required int id, required String count});
  Future<Either<Failure, String>> updateCountProduct(
      {required int cartid, required int count});
}
