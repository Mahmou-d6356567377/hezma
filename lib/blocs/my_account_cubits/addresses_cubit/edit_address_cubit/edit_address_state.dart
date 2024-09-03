part of 'edit_address_cubit.dart';

sealed class EditAddressState extends Equatable {
  const EditAddressState();

  @override
  List<Object> get props => [];
}

final class EditAddressInitial extends EditAddressState {}
final class EditAddressLoading extends EditAddressState {}
final class EditAddressSuccess extends EditAddressState {
  final String msg;

  const EditAddressSuccess(this.msg);
}
final class EditAddressFailure extends EditAddressState {
  final String errMsg;

 const  EditAddressFailure(this.errMsg);
}
