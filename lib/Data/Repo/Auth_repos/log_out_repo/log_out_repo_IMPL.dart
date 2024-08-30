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

  LogOutRepoImpl(this.apiService);
  @override
  Future<Either<Failure, dynamic>> logoutSummon() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String gtoken = pref.getString(sharedToken)!;

    print(gtoken);

    try {
      var response = await apiService.post(
          url: '${baseURL}logout', token: gtoken, body: '');
      String message = response['message'];
      return right(message);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
