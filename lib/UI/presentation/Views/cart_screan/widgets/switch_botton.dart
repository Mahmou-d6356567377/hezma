import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';

class SwitchBotton extends StatelessWidget {
  const SwitchBotton({
    super.key,
    required this.checkevening, required this.title,
  });

  final bool checkevening;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: checkevening? const Color(backgroundcolor1): const Color(backgroundcustomgreen2),
          border: Border.all(
            color: const Color(backgroundcustomgreen2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text( title ,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: !checkevening? const Color(backgroundcolor1): const Color(backgroundcustomgreen),
             
          ),),
        ),
      ),
    );
  }
}