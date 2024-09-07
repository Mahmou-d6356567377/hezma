import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/auth_models/otp_model/otp.dart';

abstract class OtpRepo {
  Future<Either<Failure, Otp>> getOtp();
  Future<Either<Failure, String>> receiveOtp({required String otp1});
}
