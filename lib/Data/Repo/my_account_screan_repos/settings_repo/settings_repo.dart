import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/models/my_account_screan_models/setting_model/datum.dart';

abstract class SettingsRepo{
  Future<Either<Failure, List<settingModel1>>> fetchSettings();
}