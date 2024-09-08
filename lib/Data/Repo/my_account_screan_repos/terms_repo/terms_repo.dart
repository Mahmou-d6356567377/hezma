import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';

abstract class TermsRepo {
  Future<Either<Failure, String>> fetchTerms();
}
