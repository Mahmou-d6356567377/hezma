import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/constants.dart';

import '../../../../utils/fonts.dart';

class TechnicalSupportScrean extends StatelessWidget {
  const TechnicalSupportScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:     AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios),),
        title: const Text('الدعم الفنى', style: arabicstyle2,),
        centerTitle: true,
      ),
      body: Column(
        children: [ 
          Image.asset(kframe), 
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 25.0),
             child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [ 
              Text('تواصل معنا عبر', style: arabicstyle2.copyWith(fontSize: 18),),
                       ],
                     ),
           ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){

            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(backgroundcustomgreen),
                    Color(backgroundcustomgreen2),
                  ]
                ),
              ),
              child: const Center( 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Text('الجوال', style: arabicstyle5,),
                  Icon(Icons.phone, color: Color(backgroundcolor1),),
                ],
              ),),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: const  Color(backgroundcustomgreen),
                )
              ),
              child: const Center( 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Text('الواتس اب', style: TextStyle(
                    color: Color(backgroundcustomgreen),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  Icon( FontAwesomeIcons.whatsapp, color: Color(backgroundcustomgreen),),
                ],
              ),),
            ),
          ),
        ),
        
        ],
      ),
    );
  }
}