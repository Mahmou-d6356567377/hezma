part of 'sign_register_cubit.dart';

sealed class SignRegisterState extends Equatable {
  const SignRegisterState();

  @override
  List<Object> get props => [];
}

final class SignRegisterInitial extends SignRegisterState {}

final class SignRegistersuccess extends SignRegisterState {
  final LoginData logindata;
  const SignRegistersuccess(this.logindata);
}

final class SignRegisterfailure extends SignRegisterState {
  final String errMsg;
  const SignRegisterfailure(this.errMsg);
}

final class SignRegisterloading extends SignRegisterState {}
