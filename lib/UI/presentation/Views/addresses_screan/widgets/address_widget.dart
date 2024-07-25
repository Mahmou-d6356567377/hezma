import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 90,
      decoration: customBoxDecoration2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Padding(
           padding:  EdgeInsets.only(bottom: 16.0),
           child:  Icon(Icons.location_on,color: Color(backgroundcustomgreen2),),
         ),
         Text('جدة ,السعوديه', style: arabicstyle2.copyWith(fontSize: 11),),
        ],
      ));
  }
}