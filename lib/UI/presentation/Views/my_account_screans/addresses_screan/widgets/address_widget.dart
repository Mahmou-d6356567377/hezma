import 'package:flutter/material.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.districtedPlace,
  });
  final AddressData districtedPlace;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
          height: 120,
          width: 90,
          decoration: customBoxDecoration2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          )),
    );
  }
}
