import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/otp_repo/otp_repo.dart';
import 'package:hezma/Data/models/otp_model/otp.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.otpRepo) : super(OtpInitial());
  OtpRepo otpRepo;
  Future<void> fetchOtp() async {
    emit(OtpLoading());
    var response = await otpRepo.getOtp();
    response.fold((failure) {
      emit(OtpFailure(failure.errorMSG));
    }, (otp) {
      print('cubit otp : ${otp.otp}');
      emit(OtpSuccess(otp));
    });
  }
}
