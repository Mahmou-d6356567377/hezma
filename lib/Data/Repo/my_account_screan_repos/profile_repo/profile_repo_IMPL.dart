
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/profile_repo/profile_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/profile/data.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl(this.apiService);
  @override
  Future<Either<Failure, ProfileData>> fetchProfileData() async {
  try {
     SharedPreferences pref  = await SharedPreferences.getInstance();
    String t = pref.getString(sharedToken)!;
   var result = await apiService.get(url: '${baseURL}get_profile', token: t) ;  
   
    ProfileData data = ProfileData.fromJson(result['data']);
   return right(data);
   } on DioException catch (e) {
    print('1 ${ServerFailure.DioException(e)}');
     return left(ServerFailure.DioException(e));
   }catch (e) {
    print('2 ${ServerFailure(e.toString())}');
     return left(ServerFailure(e.toString()));
   }
  }

}