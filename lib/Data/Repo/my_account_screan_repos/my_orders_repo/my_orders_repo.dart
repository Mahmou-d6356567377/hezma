
import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';

 abstract class MyOrderRepo{
  Future<Either<Failure, List<Product>>> fetchMyOrders ();
}