part of 'create_address_cubit.dart';

sealed class CreateAddressState extends Equatable {
  const CreateAddressState();

  @override
  List<Object> get props => [];
}

final class CreateAddressInitial extends CreateAddressState {}
final class CreateAddressFailure extends CreateAddressState {
  final String errMsg;

 const CreateAddressFailure(this.errMsg);
}
final class CreateAddressLoading extends CreateAddressState {}
final class CreateAddressSuccess extends CreateAddressState {
  final String msg;

  const CreateAddressSuccess(this.msg);
}
