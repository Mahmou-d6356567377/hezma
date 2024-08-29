// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/signIn_register_repo/signin_register_repo.dart';
import 'package:hezma/Data/models/login_model/data.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInRegisterRepoIMPL implements SignInRegisterRepo {
  final ApiService apiService;

  SignInRegisterRepoIMPL(this.apiService);

@override
Future<Either<Failure, LoginData>> signInRepo({
  required String emailOrphone,
  required String password,
  required bool isphone,
}) async {
  try {
    print('emailOrphone :: $emailOrphone' );
  
    Map<String, dynamic> body = {
      'phone': isphone ? emailOrphone : null,
     'login_by':isphone ? 'phone' :  'email',
       'email': !isphone ?emailOrphone : null ,
     'password':password,
      'fcm': '',
    };

    var response = await apiService.post(
      url: '${baseURL}login',
      token: null,
      body: body,
    );
  
     print(response['token']);
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('token', response['token']);

    if ( response['data'] == null) {
      return left(ServerFailure('Login data is null or invalid'));
    }

    var loginData = LoginData.fromJson(response['data']);
    print('sign in repo success');
    return right(loginData);
  } on DioException catch (e) {
    print('DioException in signInRepo: ${e.message}');
    return left(ServerFailure.DioException(e));
  } catch (e) {
    print('Other error in signInRepo: $e');
    return left(ServerFailure('An unexpected error occurred: $e'));
  }
}


  @override
  Future<Either<Failure, dynamic>> registerRepo(
      Map<String, dynamic> body) async {
    try {
      var getRegisterData = await apiService.post(
          url: '${baseURL}register', token: kToken, body: body);

      return right(getRegisterData);
    } on DioException catch (e) {
      print('DioException in registerRepo: ${e.message}');
      return left(ServerFailure.DioException(e));
    } catch (e) {
      print('Other error in registerRepo: $e');
      return left(ServerFailure('An unexpected error occurred: $e'));
    }
  }
}
