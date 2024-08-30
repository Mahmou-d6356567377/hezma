import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/addresses_screan/widgets/address_widget.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/get_addresses_cubit/get_addresses_cubit.dart';

class DistrictedPlacesWidget extends StatelessWidget {
  const DistrictedPlacesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<GetAddressesCubit>().fetchAddresses();

    return BlocBuilder<GetAddressesCubit, GetAddressesState>(
      builder: (context, state) {
        if (state is GetAddressesSuccess) {
          return Row(
            children: state.dataAddress.map((place) {
              return AddressItem(districtedPlace: place);
            }).toList(),
          );
        } else if (state is GetAddressesFailure) {
          print(state.errMsg);
          return Text(state.errMsg);
        } else if (state is GetAddressesLoading) {
          return const CircularProgressIndicator();
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
