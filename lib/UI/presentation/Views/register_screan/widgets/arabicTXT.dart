
import 'package:flutter/material.dart';
import 'package:hezma/utils/fonts.dart';

class Arabictext extends StatelessWidget {
  const Arabictext({
    super.key, required this.arabicText,
  });

    final String arabicText ;
  @override
  Widget build(BuildContext context) {
    return   Padding(
       padding: const  EdgeInsets.symmetric(horizontal: 10.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Text (arabicText, style: arabicstyle1,),
         ],
       ),
     );
  }
}



