import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/settings_repo/settings_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/setting_model/datum.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepoImpl implements SettingsRepo{
  final ApiService apiService;

  SettingsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<settingModel1>>> fetchSettings() async{
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String t = pref.getString(sharedToken)!;
    var result = await apiService.get(url: '${baseURL}setting_data', token: t);
    List<settingModel1> settings = (result['data'] as List).map((item)=> settingModel1.fromJson(item)).toList();
    return right(settings)  ;

    } on DioException catch (e) {
      return left( ServerFailure.DioException(e));
    }catch (e) {
      return left(ServerFailure(e.toString()));
    }

  }

}