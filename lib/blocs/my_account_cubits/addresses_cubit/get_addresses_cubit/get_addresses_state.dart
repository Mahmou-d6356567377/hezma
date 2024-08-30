part of 'get_addresses_cubit.dart';

sealed class GetAddressesState extends Equatable {
  const GetAddressesState();

  @override
  List<Object> get props => [];
}

final class GetAddressesInitial extends GetAddressesState {}
final class GetAddressesLoading extends GetAddressesState {}
final class GetAddressesSuccess extends GetAddressesState {
  final List<AddressData> dataAddress ;

  const GetAddressesSuccess(this.dataAddress);
}

final class GetAddressesFailure extends GetAddressesState {
  final String errMsg;

 const  GetAddressesFailure(this.errMsg);
}
