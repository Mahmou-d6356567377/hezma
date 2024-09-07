part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class Registersuccess extends RegisterState {
  final LoginData logindata1;
  const Registersuccess(this.logindata1);
}

final class Registerfailure extends RegisterState {
  final String errMsg;
  const Registerfailure(this.errMsg);
}

final class Registerloading extends RegisterState {}
