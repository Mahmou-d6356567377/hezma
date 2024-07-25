

import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [ 
          Container(
             decoration: BoxDecoration(
          color: const Color(backgroundcustomgreen2),
            borderRadius: BorderRadius.circular(20)
          ),
            child: IconButton(onPressed: (){
              setState(() {
                
            count++;
              });
            }, icon: const Icon(Icons.add, color: Colors.white,)),
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 12.0),
           child: Text(count.toString(),style: arabicstyle2,),
         ),
        Container(
          decoration: BoxDecoration(
          color: const Color(backgroundcustomgreen2),
            borderRadius: BorderRadius.circular(20)
          ),
          child: IconButton(onPressed: (){
             setState(() {
               count--;
             });
            }, icon: const Icon(Icons.remove , color: Colors.white,)),
        ),
        ],
      ),
    );
  }
}