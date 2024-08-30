import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/addresses_screan/widgets/address_widget.dart';
import 'package:hezma/blocs/my_account_cubits/district_places_cubit/district_places_cubit.dart';

class DistrictedPlacesWidget extends StatelessWidget {
  const DistrictedPlacesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DistrictPlacesCubit, DistrictPlacesState>(
      builder: (context, state) {
        if (state is DistrictPlacesSuccess) {
          return Row(
            children: state.districtedPlaces.map((place) {
              return AddressItem(districtedPlace: place);
            }).toList(),
          );
        } else if (state is DistrictPlacesFailure) {
          print(state.errMsg);
          return Text(state.errMsg);
        } else if (state is DistrictPlacesLoading) {
          return const CircularProgressIndicator();
        } else {
          return const Text('!!!!!!!!!!!!');
        }
      },
    );
  }
}
