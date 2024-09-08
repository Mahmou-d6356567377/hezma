import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';

abstract class WallectRepo {
  Future<Either<Failure, String>> fetchWalletData();

  Future<Either<Failure, String>> chargeWalletData(
      {required int amount, required int paymentMethodId});
}
