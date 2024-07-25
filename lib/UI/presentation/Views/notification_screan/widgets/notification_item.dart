

import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const  Color.fromARGB(255, 222, 217, 217),
          borderRadius: BorderRadius.circular(17),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [ 
              Text('مؤسسة حزمه', style: arabicstyle2,),
              Text('مرحبا بك فى مؤسسة حزمه ', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),),
              ],
                          ),
            ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.notifications, color: Color(backgroundcustomgreen2),),
          ),
    
          
        ],),
      ),
    );
  }
}

