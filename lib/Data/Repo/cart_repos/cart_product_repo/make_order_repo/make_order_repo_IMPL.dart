import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/cart_repos/cart_product_repo/make_order_repo/make_order_repo.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakeOrderRepoImpl implements MakeOrderRepo {
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
  MakeOrderRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> makeOrderFun(
      {required int paymethodId,
      required int addressId,
      required int timeId,
      required String date,
      required String shipping,
      String? coupon,
      String? userName,
      String? bankName,
      File? img}) async {
    try {
      String? token= await _getToken();
      if(token==null){
        return left(ServerFailure('Token is null'));
      }
      Map<String, dynamic> body = {
        'coupon_code': coupon,
        'payment_method_id': paymethodId,
        'address_id': addressId,
        'time_id': timeId,
        'date': date,
        'shipping': shipping,
        'user_name': userName,
        'bank_name': bankName,
      };
      var result = await apiService.post(
          url: '${baseURL}cart/make-order', token: token, body: body);
      return right(result['message']);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
