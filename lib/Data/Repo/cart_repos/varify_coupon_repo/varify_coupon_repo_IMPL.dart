import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/cart_repos/varify_coupon_repo/varify_coupon_repo.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VarifyCouponRepoImpl implements VarifyCouponRepo {
  final ApiService apiService;

  VarifyCouponRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> varifyCouponFun(
      {required String coupon}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String t = pref.getString(sharedToken)!;
    Map<String, dynamic> body = {
      'code': coupon,
    };
    try {
      var result = await apiService.post(
          url: '${baseURL}cart/verify-coupon', token: t, body: body);
      return right(result['message']);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
