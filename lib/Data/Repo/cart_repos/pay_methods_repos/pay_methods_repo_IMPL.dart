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

  PayMethodsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<PayDatum>>> fetchPayMethods() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String t = pref.getString(sharedToken)!;
      var result =
          await apiService.get(url: '${baseURL}payment_method', token: t);
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
