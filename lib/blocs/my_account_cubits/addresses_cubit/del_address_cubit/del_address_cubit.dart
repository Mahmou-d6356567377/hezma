import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/addresses_repo/addresses_repo.dart';

part 'del_address_state.dart';

class DelAddressCubit extends Cubit<DelAddressState> {
  DelAddressCubit(this.addressesRepo) : super(DelAddressInitial());
  final AddressesRepo addressesRepo;

  Future<void> delAddresses({required int id}) async {
    emit(DelAddressLoading());

    var result = await addressesRepo.delAddresses(id: id);
    result.fold((failure) {
      emit(DelAddressFailure(failure.errorMSG));
    }, (addresses) {
      emit(DelAddressSuccess(addresses));
    });
  }
}
