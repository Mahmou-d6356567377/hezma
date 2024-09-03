part of 'del_address_cubit.dart';

sealed class DelAddressState extends Equatable {
  const DelAddressState();

  @override
  List<Object> get props => [];
}

final class DelAddressInitial extends DelAddressState {}
final class DelAddressLoading extends DelAddressState {}
final class DelAddressFailure extends DelAddressState {
  final String errMsg;

 const  DelAddressFailure(this.errMsg);

}
final class DelAddressSuccess extends DelAddressState {
  final String msg;

 const  DelAddressSuccess(this.msg);
}
