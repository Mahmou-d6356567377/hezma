import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/Auth_repos/modify_account_repo/modify_account_repo.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModifyAccountRepoImpl implements ModifyAccountRepo {
  final ApiService apiService;

  ModifyAccountRepoImpl(this.apiService);
  @override
  Future<Either<Failure, dynamic>> modifyAccountRepo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token1 = pref.getString(sharedToken)!;
    try {
      var result = await apiService.post(url: 'url', token: token1, body: '');
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
