

import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class CounterWidget2 extends StatefulWidget {
  const CounterWidget2({
    super.key,
  });

  @override
  State<CounterWidget2> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget2> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisSize: MainAxisSize.min,
        children: [ 
          Container(
             decoration: BoxDecoration(
          color: const Color(backgroundcustomgreen2),
            borderRadius: BorderRadius.circular(20)
          ),
            child : GestureDetector(
            onTap: (){
              setState(() {
                count++;
              });
            },
            child: const Icon(Icons.add , color: Colors.white,))),
          
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 12.0),
           child: Text(count.toString(),style: arabicstyle2,),
         ),
        Container(
          decoration: BoxDecoration(
          color: const Color(backgroundcustomgreen2),
            borderRadius: BorderRadius.circular(20)
          ),
          child: 
         GestureDetector(
            onTap: (){
              setState(() {
                count--;
              });
            },
            child: const Icon(Icons.remove , color: Colors.white,))),
        ],
      );
  }
}