import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class CustomCoupleBotton extends StatelessWidget {
  const CustomCoupleBotton({
    super.key, required this.title1, required this.title2, required this.ontap1, required this.ontap2,
  });

final String title1 ;
final String title2 ;
final VoidCallback ontap1;
final VoidCallback ontap2;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [ 
              
        Expanded(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: GestureDetector(
          onTap:ontap2,
           child: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(17),
              color: const Color(backgroundcolor1),
            ),
            child:   Center(child:  Text(title2, style: arabicstyle4,)) ,
           ),
         ),
       ),
     ),
              
     Expanded(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: GestureDetector(
          onTap: ontap1,
           child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              gradient: const LinearGradient(colors: [
                Color(backgroundcustomgreen2),
                Color(backgroundcustomgreen),
                
              ],
              ),
            ),
            child:  Center(child:  Text(title1, style: arabicstyle2,)) ,
           ),
         ),
       ),
     ),
    ],);
  }
}
