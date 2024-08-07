import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ 
          Container(
            alignment: const Alignment(0.5, -0.6),
            child: Image.asset(kimgPg3),
      ),



      Container(
        alignment: Alignment.bottomCenter,
        child: Image.asset(kUnion,
           fit: BoxFit.fill,      
        width: MediaQuery.sizeOf(context).width,
          )),
         Container(
        alignment: const  Alignment(0.0, 0.4),
        child: Image.asset(ktext1Pg3,)),



         Container(
        alignment: const Alignment(0.0, 0.5),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ktxt2Pg3,style:  arabicstyle5.copyWith(fontSize: 11),),
            
          ],
        )),

         Container(
        alignment: const Alignment(0.0, 0.6),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ktxt3Pg3,style:  arabicstyle5.copyWith(fontSize: 11),),


          ],
        )),
        ],
      )
    );
  }
}