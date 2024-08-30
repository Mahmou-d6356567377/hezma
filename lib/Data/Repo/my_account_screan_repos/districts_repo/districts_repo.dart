import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/my_account_screan_models/dirstrict_model/datum.dart';

abstract class DistrictRepo {
  Future<Either<Failure, List<DistrictModel>>> fetchDistrictPlaces();
}
