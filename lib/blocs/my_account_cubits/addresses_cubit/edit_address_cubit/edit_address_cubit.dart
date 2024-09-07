import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/addresses_repo/addresses_repo.dart';

part 'edit_address_state.dart';

class EditAddressCubit extends Cubit<EditAddressState> {
  final AddressesRepo addressesRepo;

  EditAddressCubit(this.addressesRepo) : super(EditAddressInitial());

  Future<void> editAddress({
    required String name,
    required String address,
    required String latitude,
    required String longitude,
    required String id,
  }) async {
    emit(EditAddressLoading());

    var result = await addressesRepo.editAddresses(
      namee: name,
       addresss: address,
        latitudee: latitude,
         longitudee: longitude,
          idd: id);

    result.fold(
      (failure) => emit(EditAddressFailure(failure.errorMSG)),
      (addressData) => emit(const EditAddressSuccess('تم التعديل بنجاح')),
    );
  }
}
