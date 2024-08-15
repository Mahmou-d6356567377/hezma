
import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';

import '../../models/home_products_model/product.dart';

abstract class FavoriteProductRepo {
  
  Future<Either<Failure, List<Product>>> fetchFavProducts ();
}