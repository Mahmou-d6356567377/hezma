import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/auth_models/login_model/data.dart';

abstract class SignInRegisterRepo {
  Future<Either<Failure, LoginData>> signInRepo({
    required String emailOrphone,
    required String password,
    required bool isphone,
  });
  Future<Either<Failure, dynamic>> registerRepo(Map<String, dynamic> body);
}
