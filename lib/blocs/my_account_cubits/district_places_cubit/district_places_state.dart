part of 'district_places_cubit.dart';

sealed class DistrictPlacesState extends Equatable {
  const DistrictPlacesState();

  @override
  List<Object> get props => [];
}

final class DistrictPlacesInitial extends DistrictPlacesState {}
final class DistrictPlacesLoading extends DistrictPlacesState {}
final class DistrictPlacesSuccess extends DistrictPlacesState {
  final List<DistrictModel> districtedPlaces;

  const DistrictPlacesSuccess(this.districtedPlaces);
}
final class DistrictPlacesFailure extends DistrictPlacesState {
  final String errMsg;

 const  DistrictPlacesFailure(this.errMsg);

}
