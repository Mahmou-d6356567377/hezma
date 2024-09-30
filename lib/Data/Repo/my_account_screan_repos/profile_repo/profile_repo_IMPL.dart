import 'dart:io';

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
  ProfileRepoImpl(this.apiService);
  @override
  Future<Either<Failure, ProfileData>> fetchProfileData() async {
    try {
        String? token = await _getToken();
        if(token ==null){
          return left(ServerFailure('token is null'));
        }
      var result = await apiService.get(url: '${baseURL}get_profile', token: token);

      ProfileData data = ProfileData.fromJson(result['data']);
      return right(data);
    } on DioException catch (e) {
      print('1 ${ServerFailure.DioException(e)}');
      return left(ServerFailure.DioException(e));
    } catch (e) {
      print('2 ${ServerFailure(e.toString())}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfileData({
    required String name,
    required String phone,
    required String email,
    required String password,
    File? image,
  }) async {
    try {
        String? token = await _getToken();
        if(token ==null){
          return left(ServerFailure('token is null'));
        }
      FormData formData = FormData.fromMap({
        '_method': 'PUT',
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        if (image != null)
          'image': await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
      });

      var result = await apiService.post(
        url: '${baseURL}update_profile',
        token: token,
        body: formData,
      );
      String data = result['message'];
      print(data);
      return right(data);
    } on DioException catch (e) {
      print(' 1$e');
      return left(ServerFailure.DioException(e));
    } catch (e) {
      print('2 ${e}');
      return left(ServerFailure(e.toString()));
    }
  }
}
