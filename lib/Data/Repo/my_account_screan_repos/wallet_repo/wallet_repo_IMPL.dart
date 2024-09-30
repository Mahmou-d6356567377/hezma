import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/wallet_repo/wallet_repo.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletRepoImpl implements WallectRepo {
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
  WalletRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> fetchWalletData() async {
    try {
     String? token = await _getToken();
     if (token == null) {
     return left(ServerFailure('token is null'));
     }
      var result = await apiService.get(url: '${baseURL}wallet', token: token);
      String resultplus = result['wallet'];
      print(resultplus);
      return right(resultplus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, String>> chargeWalletData(
      {required int amount, required int paymentMethodId}) async {
    try {
     String? token = await _getToken();
     if (token == null) {
     return left(ServerFailure('token is null'));
     }
      Map<String, dynamic> body = {
        'amount': amount,
        'payment_method_id': paymentMethodId,
      };
      var result = await apiService.post(
          url: '${baseURL}charge_wallet', token: token, body: body);
      String resultplus = result['wallet'];
      print(resultplus);
      return right(resultplus);
    } on DioException catch (e) {
      return left(ServerFailure.DioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
