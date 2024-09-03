import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/addresses_repo/addresses_repo.dart';

part 'create_address_state.dart';

class CreateAddressCubit extends Cubit<CreateAddressState> {
  CreateAddressCubit(this.addressesRepo) : super(CreateAddressInitial());
  final AddressesRepo addressesRepo;


  Future<void> createAddress({
    required String name,
    required String address,
    required String latitude,
    required String longitude,
  }) async {
    emit(CreateAddressLoading());

    var result = await addressesRepo.createAddresses(
      name: name,
       address: address,
        latitude: latitude,
         longitude: longitude,
          );

    result.fold(
      (failure) => emit(CreateAddressFailure(failure.errorMSG)),
      (addressData) => emit(const CreateAddressSuccess('Address created successfully')),
    );
  }
}
