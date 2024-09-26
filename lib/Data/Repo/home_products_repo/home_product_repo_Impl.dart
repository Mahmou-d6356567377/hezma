import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo.dart';
import 'package:hezma/Data/models/home_models/home_products_model/category.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/Data/models/home_models/home_products_model/slider.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProductRepoIMPL implements HomeProductRepo {
  final ApiService apiservice;

  HomeProductRepoIMPL(
    this.apiservice,
  );

  @override
  Future<Either<Failure, List<Product>>> fetchHomeProduct() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token1 = pref.getString(sharedToken)!;
      var data = await apiservice.post(
          url: '${baseURL}home?page=1', token: token1, body: null);
      List<Product> products = [];
      for (var item in data['data']['products']) {
        products.add(Product.fromJson(item));
      }

      return right(products);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchCategoryProduct(
      String subCategoryId) async {
    try {
      var data = await apiservice.post(
          url: '${baseURL}home?page=1', token: '', body: null);
      List<Product> filteredProducts = [];

      for (var item in data['data']['products']) {
        if (item['sub_category_id'] == subCategoryId) {
          filteredProducts.add(Product.fromJson(item as Map<String, dynamic>));
        }
      }

      return right(filteredProducts);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> fetchHomeImages() async {
    try {
      var data = await apiservice.post(
          url: '${baseURL}home?page=1', token: '', body: null);
      List<Category> products = [];

      for (var item in data['extra_data']['categories']) {
        products.add(Category.fromJson(item));
      }

      return right(products);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Slider>>> fetchHomeslider() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token1 = pref.getString(sharedToken)!;
      var data = await apiservice.post(
          url: '${baseURL}home?page=1', token: token1, body: null);
      List<Slider> products = [];

      for (var item in data['extra_data']['sliders']) {
        products.add(Slider.fromJson(item));
      }

      return right(products);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
