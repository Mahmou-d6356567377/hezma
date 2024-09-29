import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_card_details/datum.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_product_model/data.dart';

abstract class MyOrderRepo {
  Future<Either<Failure, List<OrderData>>> fetchMyOrders();
  Future<Either<Failure, List<OrderData>>> fetchcanceledOrders();
  Future<Either<Failure, List<OrderData>>> fetchMyPreviousOrders();
  Future<Either<Failure, String>> cancelOrder({required int id});
  Future<Either<Failure, OrderProductModel>> fetchMyOrdersData(
      {required int id});
  Future<Either<Failure, List<OrderData>>> makeOrdersData({
    required int payid,
    required int addressid,
    required String date,
    required int timeid,
    required int shipping,
    required String username,
    required String bankname,
  });
}
