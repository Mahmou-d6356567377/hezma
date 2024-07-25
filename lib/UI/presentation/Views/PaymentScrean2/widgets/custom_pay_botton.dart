import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';
import '../../cart_screan/widgets/text_row.dart';
import '../../register_screan/widgets/customTextField.dart';

class CustomPayBotton2 extends StatelessWidget {
  const CustomPayBotton2({
    super.key, required this.firstController, 
    required this.secondController, 
    required this.thirdController,
     required this.fourthController,
  });
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final TextEditingController fourthController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 50),
      child: GestureDetector(
        onTap: (){
          showDialog(context: context, 
           builder: (context) => AlertDialog(
            actions: [
              Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الدفع الكترونى',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const TextRow(title: 'الاسم على البطاقه'),
          CustomTextField(
            hintText: '',
            prefixIcon: const Icon(Icons.data_saver_on),
            controller: firstController,
          ),
          const TextRow(title: 'رقم البطاقه'),
          CustomTextField(
            hintText: '',
            prefixIcon: const Icon(Icons.data_saver_on),
            controller: secondController,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const TextRow(title: 'رقم التحقق'),
                    CustomTextField(
                      hintText: 'CVV',
                      prefixIcon: const Icon(Icons.date_range),
                      controller: thirdController,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const TextRow(title: 'تاريخ الانتهاء'),
                    CustomTextField(
                      hintText: 'شهر|سنه',
                      prefixIcon: const Icon(Icons.date_range),
                      controller: fourthController,
                    ),
                  
                  ],
                ),
              ),
            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
               GestureDetector(
                onTap: (){
                GoRouter.of(context).pop();

                },
                 child: Container(
                   height: 50,
                   width: 200,
                   decoration: BoxDecoration(
                     gradient: const LinearGradient(
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       colors:[
                       Color(backgroundcustomgreen),
                       Color(backgroundcustomgreen2),
                     ] ,
                     ),
                     borderRadius: BorderRadius.circular(17),
                   ),
                   child: const Center(child: Center(child: Text('اضافة',style: arabicstyle5,))),
                 ),
               ),
              ],
            ),
        ],
      ),
            ],
           ),
          );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[
              Color(backgroundcustomgreen),
              Color(backgroundcustomgreen2),
            ] ,
            ),
            borderRadius: BorderRadius.circular(17),
          ),
          child: const Center(child: Text('اضافة طريقة دفع',style: arabicstyle5,)),
        ),
      ),
    );
  }
}

