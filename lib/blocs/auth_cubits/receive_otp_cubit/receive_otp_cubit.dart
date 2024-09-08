import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/Auth_repos/otp_repo/otp_repo.dart';

part 'receive_otp_state.dart';

class ReceiveOtpCubit extends Cubit<ReceiveOtpState> {
  ReceiveOtpCubit(this.otpRepo) : super(ReceiveOtpInitial());
  OtpRepo otpRepo;

  Future<void> receiveOtp({required String otp1}) async {
    emit(ReceiveOtpLoading());
    var response = await otpRepo.receiveOtp(otp1: otp1);
    response.fold((failure) {
      emit(ReceiveOtpFailure(failure.errorMSG));
    }, (receivedotp) {
      print('received otp : $receivedotp');
      emit(ReceiveOtpSuccess(receivedotp));
    });
  }
}
