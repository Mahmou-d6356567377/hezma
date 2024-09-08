part of 'wallet_cubit.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}
final class WalletLoading extends WalletState {}
final class WalletSuccess extends WalletState {
  final String data ;

  const WalletSuccess(this.data);
}
final class WalletFailure extends WalletState {
  final String  errMsg;

  const WalletFailure(this.errMsg);
}
