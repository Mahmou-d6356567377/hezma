import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/text_row.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/customTextField.dart';
import 'package:hezma/utils/fonts.dart';
import '../../../../../utils/constants.dart';

class Pay3PageWidget extends StatelessWidget {
  const Pay3PageWidget({
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text( 'مؤسسة حزمه',style: arabicstyle1.copyWith(fontSize: 20),),
            ],
          ),
        ),
          
          const TextRow(title: 'رقم المؤسسه'),
         
             CustomTextField(
              hintText: '',
              prefixIcon: const Icon(Icons.data_saver_on),
              controller: firstController,
          ),
          const TextRow(title: 'رقم المحمول'),
          CustomTextField(
            hintText: '',
            prefixIcon: const Icon(Icons.data_saver_on),
            controller: secondController,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const TextRow(title: 'صورة الايصال'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const  Color(darkwhite),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: const Center(child: Icon(Icons.image),),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const TextRow(title: 'اسم البنك'),
                    CustomTextField(
                      hintText: '',
                      prefixIcon: const Icon(Icons.recommend_rounded),
                      controller: thirdController,
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
