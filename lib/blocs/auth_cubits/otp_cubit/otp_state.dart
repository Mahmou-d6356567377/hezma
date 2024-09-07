part of 'otp_cubit.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitial extends OtpState {}

final class OtpLoading extends OtpState {}

final class OtpFailure extends OtpState {
  final String errMsg;

  const OtpFailure(this.errMsg);
}

final class OtpSuccess extends OtpState {
  final Otp otp;

  const OtpSuccess(this.otp);
}