import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/cart_model/datum.dart';

abstract class CartProductRepo {
  Future<Either<Failure, List<CartProductModel>>> addCartProduct();
  Future<Either<Failure, List<CartProductModel>>> removeCartProduct();
}
