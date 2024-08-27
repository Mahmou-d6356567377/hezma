import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/cart_repo/cart_repo.dart';
import 'package:hezma/Data/models/cart_model/datum.dart';
import 'package:hezma/utils/API/api_service.dart';

class CartProductRepoIMPL implements CartProductRepo {
  final ApiService apiservice;

  CartProductRepoIMPL(
    this.apiservice,
  );

  @override
  Future<Either<Failure, List<CartProductModel>>> addCartProduct() {
    // TODO: implement addCartProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CartProductModel>>> removeCartProduct() {
    // TODO: implement removeCartProduct
    throw UnimplementedError();
  }
}
