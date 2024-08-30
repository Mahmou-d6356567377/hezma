import 'package:dartz/dartz.dart';
import 'package:hezma/Data/Errors/failures.dart';
import 'package:hezma/Data/Repo/Auth_repos/otp_repo/otp_repo.dart';
import 'package:hezma/Data/models/auth_models/otp_model/otp.dart';
import 'package:hezma/utils/API/api_service.dart';
import 'package:hezma/utils/constants.dart';

class OtpRepoImpl implements OtpRepo {
  final ApiService apiService;

  OtpRepoImpl(this.apiService);
  @override
  Future<Either<Failure, Otp>> getOtp() async {
    try {
      var result = await apiService.post(
          url: '${baseURL}send_otp', token: kToken, body: '');
      Otp otp = Otp.fromJson(result);
      print('otp repo ${otp.otp}');
      return right(otp);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
