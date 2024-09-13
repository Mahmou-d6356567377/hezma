import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_details_model/data.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrdersRepoImpl implements MyOrderRepo {
  final ApiService apiService;

  MyOrdersRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Product>>> fetchMyOrders() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String mToken = pref.getString(sharedToken)!;
      var result = await apiService.get(url: '${baseURL}orders', token: mToken);
      List<Product> resultPlus = (result['data'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
      return right(resultPlus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      print(ServerFailure(e.toString()));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderData>> fetchMyOrdersData(
      {required int id}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String t = pref.getString(sharedToken)!;
      var result =
          await apiService.get(url: '${baseURL}order/details/$id', token: t);
      OrderData resultPlus = OrderData.fromJson(result['data']);
      return right(resultPlus);
    } on DioException catch (e) {
      print('Dio Error $e');
      return left(ServerFailure.DioException(e));
    } catch (e) {
      print('Error $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
