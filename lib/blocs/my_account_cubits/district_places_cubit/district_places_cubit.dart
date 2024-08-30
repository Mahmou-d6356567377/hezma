import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/districts_repo/districts_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/dirstrict_model/datum.dart';
part 'district_places_state.dart';

class DistrictPlacesCubit extends Cubit<DistrictPlacesState> {
  DistrictPlacesCubit(this.districtsRepo) : super(DistrictPlacesInitial());
  final DistrictRepo districtsRepo;

Future<void> fetchDistrictPlaces () async{
  
    emit(DistrictPlacesLoading());
  var districtedPlaces = await  districtsRepo.fetchDistrictPlaces();
   districtedPlaces.fold((failure){
   emit(DistrictPlacesFailure(failure.toString()));
   }, (districtedplaced){
    emit(DistrictPlacesSuccess(districtedplaced as List<DistrictModel> ));
   });
  
}
  
}
