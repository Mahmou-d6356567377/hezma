import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';

abstract class VarifyCouponRepo {
  Future<Either<Failure, String>> varifyCouponFun({required String coupon});
}
