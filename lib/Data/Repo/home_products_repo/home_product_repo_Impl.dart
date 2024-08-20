import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo.dart';
import 'package:hezma/Data/models/home_products_model/product.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';

class HomeProductRepoIMPL implements HomeProductRepo {
  final ApiService apiservice;

  HomeProductRepoIMPL(
    this.apiservice,
  );

  @override
  Future<Either<Failure, List<Product>>> fetchHomeProduct() async {
    try {
      var data = await apiservice.post(url: '${baseURL}home?page=1', token: '');
      List<Product> products = [];

      for (var item in data['data']['products']) {
        products.add(Product.fromJson(item));
      }

      return right(products);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
