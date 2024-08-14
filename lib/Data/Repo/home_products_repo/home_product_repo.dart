import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/home_products_model/product.dart';


abstract class HomeProductRepo {
Future<Either<Failure, List<Product>>> fetchHomeProduct ();
}
