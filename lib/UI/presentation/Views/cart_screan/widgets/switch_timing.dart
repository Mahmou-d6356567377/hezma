
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/switch_botton.dart';

import '../../../../../utils/constants.dart';

class SwitchTime extends StatefulWidget {
  const SwitchTime({super.key});

  @override
  State<SwitchTime> createState() => _SwitchTimeState();
}

class _SwitchTimeState extends State<SwitchTime> {
  bool checkevening = false;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                checkevening = !checkevening;
              });
            },
            child: SwitchBotton(checkevening: checkevening,title: 'الصباح',),
            
          ),
        ),
       Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                checkevening = !checkevening;
              });
            },
            child: SwitchBotton(checkevening: !checkevening,title: 'المساء',),
            
          ),
        ),
      ],
    );
  }
}

