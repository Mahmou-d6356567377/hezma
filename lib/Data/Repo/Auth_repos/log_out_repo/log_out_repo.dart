import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';

abstract class LogOutRepo {
   Future<Either<Failure, dynamic>> logoutSummon();
}