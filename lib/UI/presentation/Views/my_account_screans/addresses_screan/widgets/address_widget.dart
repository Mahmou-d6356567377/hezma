import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/del_address_cubit/del_address_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.districtedPlace,
    required this.selected,
    required this.onTap, 
  });

  final AddressData districtedPlace;
  final bool selected; 
  final VoidCallback onTap; 

  void _onSelected(BuildContext context, String value) {
    switch (value) {
      case 'erase':
        context.read<DelAddressCubit>().delAddresses(id: districtedPlace.id!);
        print("Erase tapped");
        break;
          case 'edit':
         GoRouter.of(context).push(AppRoutes.eas, extra: districtedPlace);
        print("Edit tapped");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the onTap callback when the item is tapped
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          height: 120,
          width: 90,
          decoration: customBoxDecoration2.copyWith(
            color: selected ? Colors.green.withOpacity(.5) : Colors.white, // Change color based on selection
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton(
                  onSelected: (value) => _onSelected(context, value),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'erase',
                      child: Text('Erase'),
                    ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('edit'),
                    ),
                  ],
                  child: const Icon(
                    Icons.more_vert,
                    color: Color(backgroundcustomgreen2),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Icon(
                  Icons.location_on,
                  color: Color(backgroundcustomgreen2),
                ),
              ),
              Text(
                districtedPlace.name!,
                style: arabicstyle2.copyWith(fontSize: 11),
              ),
               Flexible(
                 child: Text(
                   overflow: TextOverflow.ellipsis,
                   maxLines: 1,
                  districtedPlace.address!,
                  style: arabicstyle2.copyWith(fontSize: 11),
                               ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
