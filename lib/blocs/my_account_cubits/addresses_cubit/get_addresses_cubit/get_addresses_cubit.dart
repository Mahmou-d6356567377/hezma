import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/addresses_repo/addresses_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';

part 'get_addresses_state.dart';

class GetAddressesCubit extends Cubit<GetAddressesState> {
  GetAddressesCubit(this.addressesRepo) : super(GetAddressesInitial());
  final AddressesRepo addressesRepo;

  Future<void> fetchAddresses () async {
    emit(GetAddressesLoading());

   var result =  await addressesRepo.getAddresses();
   result.fold((failure){
    emit(GetAddressesFailure(failure.errorMSG));
   }, (addresses){
   emit(GetAddressesSuccess(addresses));
   }
   );
  }
}
