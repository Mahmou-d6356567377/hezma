// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/Auth_repos/log_out_repo/log_out_repo.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutRepoImpl implements LogOutRepo {
  final ApiService apiService;
 Future<String?> _getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token1 = pref.getString(sharedToken);
    final String? token2 = pref.getString(sharedregisterToken);

    if (token1 != null) {
      return token1;
    } else if (token2 != null) {
      return token2;
    } else {
      return null;
    }
  }
  LogOutRepoImpl(this.apiService);
  @override
  Future<Either<Failure, dynamic>> logoutSummon() async {
 

    try {
      String? token1 = await _getToken();
      if (token1 ==null) {
        return left(ServerFailure('Token is NOt available'));
      }
      
      var response = await apiService.post(
          url: '${baseURL}logout', token: token1, body: '');
      String message = response['message'];
      return right(message);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
