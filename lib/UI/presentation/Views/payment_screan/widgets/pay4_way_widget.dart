import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';

class Pay4PageWidget extends StatelessWidget {
  const Pay4PageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column( 
        children: [ 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(kpay4rec1 , fit: BoxFit.fill,),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(kpay4rec2, fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
    );
  }
}