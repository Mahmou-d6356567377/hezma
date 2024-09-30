import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_card_details/datum.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_product_model/data.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrdersRepoImpl implements MyOrderRepo {
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
  MyOrdersRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<OrderData>>> fetchMyOrders() async {
    try {
      String? token = await _getToken();
      if (token == null) {
        return left(ServerFailure('Token is Null'));
      }
      var result = await apiService.get(url: '${baseURL}orders', token: token);
      List<OrderData> resultPlus = (result['data'] as List)
          .map((item) => OrderData.fromJson(item))
          .toList();
      return right(resultPlus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderProductModel>> fetchMyOrdersData(
      {required int id}) async {
    try {
      String? token = await _getToken();
      if (token == null) {
        return left(ServerFailure('Token is Null'));
      }
      var result =
          await apiService.get(url: '${baseURL}order/details/$id', token: token);
      OrderProductModel resultPlus = OrderProductModel.fromJson(result['data']);
      return right(resultPlus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> cancelOrder({required int id}) async {
    try {
      String? token = await _getToken();
      if (token == null) {
        return left(ServerFailure('Token is Null'));
      }
      var result = await apiService.post(
          url: '${baseURL}order/cancel/$id', token: token, body: '');
      fetchMyOrders();
      return right(result['message']);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderData>>> fetchMyPreviousOrders() async {
    try {
      String? token = await _getToken();
      if (token == null) {
        return left(ServerFailure('Token is Null'));
      }
      var result = await apiService.get(url: '${baseURL}orders', token: token);
      List<OrderData> resultPlus = (result['extra_data']['Previous'] as List)
          .map((item) => OrderData.fromJson(item))
          .toList();
      return right(resultPlus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderData>>> fetchcanceledOrders() async {
    try {
      String? token = await _getToken();
      if (token == null) {
        return left(ServerFailure('Token is Null'));
      }
      var result = await apiService.get(url: '${baseURL}orders', token: token);
      List<OrderData> resultPlus = (result['extra_data']['Canceled'] as List)
          .map((item) => OrderData.fromJson(item))
          .toList();
      return right(resultPlus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderData>>> makeOrdersData({
    required int payid,
    required int addressid,
    required String date,
    required int timeid,
    required int shipping,
    required String username,
    required String bankname,
    String? couponCode,
  }) async {
    try {
      String? token = await _getToken();
      if (token == null) {
        return left(ServerFailure('Token is Null'));
      }
      Map<String, dynamic> body = {
        'coupon_code': couponCode,
        'payment_method_id': payid,
        'address_id': addressid,
        'time_id': timeid,
        'date': date,
        'shipping': shipping,
        'user_name': username,
        'bank_name': bankname,
      };
      var result = await apiService.post(
          url: '${baseURL}cart/make-order', token: token, body: body);
      List<OrderData> resultPlus = (result['extra_data']['Canceled'] as List)
          .map((item) => OrderData.fromJson(item))
          .toList();
      return right(resultPlus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
