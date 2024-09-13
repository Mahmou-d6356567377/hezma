import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/cart_models/pay_mothod_model/datum.dart';

abstract class PayMethodsRepo {
  Future<Either<Failure, List<PayDatum>>> fetchPayMethods();
}
