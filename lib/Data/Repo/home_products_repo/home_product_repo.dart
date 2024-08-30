import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/home_models/home_products_model/category.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/Data/models/home_models/home_products_model/slider.dart';

abstract class HomeProductRepo {
  Future<Either<Failure, List<Product>>> fetchHomeProduct();
  Future<Either<Failure, List<Category>>> fetchHomeImages();
  Future<Either<Failure, List<Slider>>> fetchHomeslider();
  Future<Either<Failure, List<Product>>> fetchCategoryProduct(String id);
}
