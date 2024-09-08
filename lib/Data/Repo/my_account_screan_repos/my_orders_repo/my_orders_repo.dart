import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_details_model/data.dart';

abstract class MyOrderRepo {
  Future<Either<Failure, List<Product>>> fetchMyOrders();
  Future<Either<Failure, OrderData>> fetchMyOrdersData({required int id});
}
