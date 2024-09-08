
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrdersRepoImpl implements MyOrderRepo {
  final ApiService apiService;

  MyOrdersRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Product>>> fetchMyOrders() async{
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
       String mToken =  pref.getString(sharedToken)!;
       var  result = await apiService.get(url: '${baseURL}orders', token: mToken);
       return right(result['data']);
    } on DioException catch (e) {
       return left(ServerFailure.DioException(e));
    }catch (e) {
       return left(ServerFailure(e.toString()));
    }
  }

}