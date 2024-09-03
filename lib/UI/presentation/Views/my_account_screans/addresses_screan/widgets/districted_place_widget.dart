import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/addresses_repo/addresses_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/addresses_screan/widgets/address_widget.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/get_addresses_cubit/get_addresses_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/del_address_cubit/del_address_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/edit_address_cubit/edit_address_cubit.dart';

class DistrictedPlacesWidget extends StatefulWidget {
  final Function(AddressData) onAddressSelected;

  const DistrictedPlacesWidget({
    super.key,
    required this.onAddressSelected,
  });

  @override
  _DistrictedPlacesWidgetState createState() => _DistrictedPlacesWidgetState();
}

class _DistrictedPlacesWidgetState extends State<DistrictedPlacesWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    context.read<GetAddressesCubit>().fetchAddresses();

    return MultiBlocListener(
      listeners: [
        BlocListener<DelAddressCubit, DelAddressState>(
          listener: (context, state) {
            if (state is DelAddressSuccess) {
              context.read<GetAddressesCubit>().fetchAddresses();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.msg)),
              );
            } else if (state is DelAddressFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMsg)),
              );
            }
          },
        ),
        BlocListener<EditAddressCubit, EditAddressState>(
          listener: (context, state) {
            if (state is EditAddressSuccess) {
              context.read<GetAddressesCubit>().fetchAddresses();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.msg)),
              );
            } else if (state is EditAddressFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMsg)),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<GetAddressesCubit, GetAddressesState>(
        builder: (context, state) {
          if (state is GetAddressesSuccess) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.dataAddress.map((place) {
                  int index = state.dataAddress.indexOf(place);
                  
                  return BlocProvider(
                    create: (_) => EditAddressCubit(context.read<AddressesRepo>()),
                    child: AddressItem(
                      districtedPlace: place,
                      selected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        
                        // Convert lat and lng strings to double and create LatLng object
                        double? latitude = double.tryParse(place.lat ?? '');
                        double? longitude = double.tryParse(place.lng ?? '');
                        
                        if (latitude != null && longitude != null) {
                          widget.onAddressSelected(place);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Invalid coordinates')),
                          );
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            );
          } else if (state is GetAddressesFailure) {
            return Text(state.errMsg);
          } else if (state is GetAddressesLoading) {
            return const CircularProgressIndicator();
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
