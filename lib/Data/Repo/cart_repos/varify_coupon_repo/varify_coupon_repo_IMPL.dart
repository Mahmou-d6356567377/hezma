import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/cart_repos/varify_coupon_repo/varify_coupon_repo.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VarifyCouponRepoImpl implements VarifyCouponRepo {
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
  VarifyCouponRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> varifyCouponFun(
      {required String coupon}) async {
    Map<String, dynamic> body = {
      'code': coupon,
    };
    try {
      String? token = await _getToken();
      if (token == null) {
      return left(ServerFailure('token is null'));
      }
      var result = await apiService.post(
          url: '${baseURL}cart/verify-coupon', token: token, body: body);
      return right(result['message']);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
