part of 'receive_otp_cubit.dart';

sealed class ReceiveOtpState extends Equatable {
  const ReceiveOtpState();

  @override
  List<Object> get props => [];
}

final class ReceiveOtpInitial extends ReceiveOtpState {}
final class ReceiveOtpLoading extends ReceiveOtpState {}
final class ReceiveOtpSuccess extends ReceiveOtpState {
  final String receivedMsg;

  const ReceiveOtpSuccess(this.receivedMsg);
}
final class ReceiveOtpFailure extends ReceiveOtpState {
  final String errorMSG;

  const ReceiveOtpFailure(this.errorMSG);
}
