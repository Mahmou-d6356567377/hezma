

import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class NavigationButton extends StatelessWidget {

  final String title ;
  final bool isClicked ;
  const NavigationButton({
    super.key, required this.title,
    this.isClicked= false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 30,
       decoration: BoxDecoration(
         color: isClicked ? const  Color(backgroundcustomgreen): const Color(backgroundcolor1),
         
         border: Border.all(
           color: const Color(backgroundcustomgreen),
         ),
         borderRadius: BorderRadius.circular(25),
       ),
        child:   Center(child: Text( title, style: (isClicked) ? arabicstyle5 : arabicstyle4,)),
      ),
    );
  }
}