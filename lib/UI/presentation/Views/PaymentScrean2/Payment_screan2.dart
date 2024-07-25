import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/PaymentScrean2/widgets/custom_pay_botton.dart';
import 'package:hezma/UI/presentation/Views/PaymentScrean2/widgets/custom_pay_item.dart';

import '../../../../utils/fonts.dart';

class PaymentScrean2 extends StatelessWidget {
  const  PaymentScrean2({super.key});

  @override
  Widget build(BuildContext context) {
  final TextEditingController firstController = TextEditingController();
   final TextEditingController secondController = TextEditingController();
   final TextEditingController thirdController = TextEditingController();
   final TextEditingController fourthController = TextEditingController();

    return  Scaffold(
      appBar:     AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios),),
        title: const Text('الدفع', style: arabicstyle2,),
        centerTitle: true,
      ),
      body: Column(
        children: [ 
          const Row(
            children: [
              Expanded(child: CustompayItem(ismada: true,)),
              Expanded(child: CustompayItem(ismada: false,)),
            ],
          ),
          

          const  Row(
            children: [
              Expanded(child: CustompayItem(ismada: true,)),
              Expanded(child: CustompayItem(ismada: false,)),
            ],
          ),
         const Spacer(),
          CustomPayBotton2(firstController: firstController, secondController: secondController, thirdController: thirdController, fourthController: fourthController)
        ],
      ),
    );
  }
}

