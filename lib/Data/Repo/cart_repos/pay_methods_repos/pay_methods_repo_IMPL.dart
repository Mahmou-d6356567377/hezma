import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/cart_repos/pay_methods_repos/pay_methods_repo.dart';
import 'package:hezma/Data/models/cart_models/pay_mothod_model/datum.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayMethodsRepoImpl implements PayMethodsRepo {
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
  PayMethodsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<PayDatum>>> fetchPayMethods() async {
    try {
      String? token1 = await _getToken();
      if (token1 ==null) {
      return left(ServerFailure('Token is null'));
      }
      var result =
          await apiService.get(url: '${baseURL}payment_method', token: token1);
      var resultPlus = (result['data'] as List)
          .map((item) => PayDatum.fromJson(item))
          .toList();
      return right(resultPlus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
