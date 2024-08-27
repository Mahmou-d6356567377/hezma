import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/cart_repo/cart_repo.dart';
import 'package:hezma/Data/models/cart_model/datum.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';

class CartProductRepoIMPL implements CartProductRepo {
  final ApiService apiservice;

  CartProductRepoIMPL(
    this.apiservice,
  );

  @override
  Future<Either<Failure, List<CartProductModel>>> fetchCartProduct() async {
    try {
      var data = await apiservice.get(url: '${baseURL}cart', token: kToken);
      List<CartProductModel> products = [];

      for (var item in data['data']['details']) {
        products.add(CartProductModel.fromJson(item));
      }

      return right(products);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
