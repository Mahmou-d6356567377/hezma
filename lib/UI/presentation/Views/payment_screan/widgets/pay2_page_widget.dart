import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/text_row.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/customTextField.dart';
import '../../../../../utils/constants.dart';

class Pay2PageWidget extends StatelessWidget {
  const Pay2PageWidget({
    Key? key,
    required this.firstController,
    required this.secondController,
    required this.thirdController,
    required this.fourthController
  }) : super(key: key);

  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final TextEditingController fourthController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تقبل الدفع عن طريق',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(kpaylogo, width: MediaQuery.sizeOf(context).width,),
              ],
            ),
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
        ],
      ),
    );
  }
}
