import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/Auth_repos/otp_repo/otp_repo.dart';
import 'package:hezma/Data/models/auth_models/otp_model/otp.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpRepoImpl implements OtpRepo {
  final ApiService apiService;

  OtpRepoImpl(this.apiService);
  @override
  Future<Either<Failure, Otp>> getOtp() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String shToken = pref.getString(sharedregisterToken)!;
             var result = await apiService.post(
          url: '${baseURL}send_otp', token: shToken, body: '');
      Otp otp = Otp.fromJson(result);
      print(' otp rep Impl  ${otp.otp}');
      return right(otp);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }



  Future<Either<Failure, String>> receiveOtp({required String otp1}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String shToken = pref.getString(sharedregisterToken)!;
     Map<String, dynamic> body = {
      'otp': otp1 , 
     };

          var result = await apiService.post(
       url: '${baseURL}received_otp', token: shToken, body: body);
      String recieveMsg = result['message'];
      return right(recieveMsg);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
