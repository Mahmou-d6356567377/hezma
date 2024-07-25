import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';

import '../../../../../utils/fonts.dart';

class LastFollowContainer extends StatelessWidget {
  const LastFollowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Container(
        decoration: customBoxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ 
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient:const  LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  Color(backgroundcustomgreen),
                  Color(backgroundcustomgreen2),
                ]
                ),
              ),
              child: const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('تواصل مع الدعم', style:arabicstyle5,),
              ),
            ),
            const Spacer(),
             const Column(
              children: [
                Text('محمود',style: arabicstyle2,),
                Text('دليفرى',style: arabicstyle1,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(kcircleImge, width: 50,),
            ),
      
           
          ],
        ),
      ),
    );
  }
}

