import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';

abstract class MakeOrderRepo {
  Future<Either<Failure, String>> makeOrderFun({
    required int paymethodId,
    required int addressId,
    required int timeId,
    required String date,
    required String shipping,
    String? coupon,
    String? userName,
    String? bankName,
    File? img,
  });
}
