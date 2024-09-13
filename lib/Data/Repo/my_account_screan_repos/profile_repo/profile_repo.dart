import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/my_account_screan_models/profile/data.dart';

abstract class ProfileRepo {
  Future<Either<Failure , ProfileData>> fetchProfileData ();
}