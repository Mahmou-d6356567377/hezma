import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class PayWayBotton extends StatelessWidget {
  const PayWayBotton({
    super.key, required this.title, required this.img, required this.isclick,
  });

  final String title; 
  final String img;
  final bool isclick ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 60,
       decoration: BoxDecoration(
         color: isclick?  const Color(backgroundcustomgreen2) :  Colors.white,
         borderRadius: BorderRadius.circular(17),
       ),
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [ 
             Text( title , style: isclick ?  arabicstyle5.copyWith(fontSize: 5) :  arabicstyle2.copyWith(fontSize: 5),),
             Image.asset(img),
           ],
         ),
       ),
      ),
    );
  }
}

