import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/payment_screan/widgets/pay2_page_widget.dart';
import 'package:hezma/UI/presentation/Views/payment_screan/widgets/pay3_page_widget.dart';
import 'package:hezma/UI/presentation/Views/payment_screan/widgets/pay4_way_widget.dart';

import '../../../../../utils/constants.dart';

class SwitchPayContainers extends StatelessWidget {
  const SwitchPayContainers({super.key,  required this.iscontainer1, required this.iscontainer2, required this.iscontainer3, required this.iscontainer4, required this.firstController, required this.secondController, required this.thirdController, required this.forthController});

  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController ;
  final TextEditingController forthController ;
   final  bool iscontainer1 ;
   final  bool iscontainer2 ;
   final  bool iscontainer3 ;
   final  bool iscontainer4 ;
  @override
  Widget build(BuildContext context) {
    Widget containerContent ;
     if (iscontainer1) {
      containerContent = SizedBox(
        child: Image.asset(kpay1mg1, fit: BoxFit.fill,),
      );
    } else if (iscontainer2) {
      containerContent = SizedBox(
        child:  Pay2PageWidget(firstController: firstController, secondController: secondController, thirdController: thirdController , fourthController: forthController,)
      );
    } else if (iscontainer3) {
      containerContent = SizedBox(
        child:  Pay3PageWidget(firstController: firstController, secondController: secondController, thirdController: thirdController , fourthController: forthController,)
      );
    } else {
      containerContent = const  SizedBox(
        child: Pay4PageWidget()
      );
    }
    return containerContent;
  }
}