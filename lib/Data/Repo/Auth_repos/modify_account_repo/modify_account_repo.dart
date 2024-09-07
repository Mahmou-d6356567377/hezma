import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';

abstract class ModifyAccountRepo{

  Future<Either<Failure , dynamic>> modifyAccountRepo ();
}