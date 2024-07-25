import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';

class LocationWidgetOrder extends StatelessWidget {
  const LocationWidgetOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [ 
        Icon(Icons.location_on, color: Color(backgroundcustomgreen),),
        Text('الرياض ,السعودية', style: TextStyle(
          fontSize: 10,
        )),
      ],
    );
  }
}