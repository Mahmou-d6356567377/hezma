import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class MyAccountItem extends StatelessWidget {
  const MyAccountItem({
    super.key, required this.title, required this.icon, required this.ontap,
  });
  final String title;
  final Icon icon;
  final VoidCallback ontap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: const Color(darkwhite),
         ),
          child:   Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ 
              Text(title, style: arabicstyle2,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:icon),
            ],
          ),
        ),
      ),
    );
  }
}