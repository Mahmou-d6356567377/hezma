import 'package:flutter/material.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../utils/constants.dart';

class CustomIntlPhoneField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomIntlPhoneField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntlPhoneField(
        initialCountryCode: 'SA',
        controller: controller,
         validator: (value) {
            if (value == null || value.toString().isEmpty) {
              return 'يرجى ادخال يرقم الهاتف';
            }
            return null;
          },
          
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:  const TextStyle(fontFamily: karabicFont1,),
          alignLabelWithHint: true,
          hintTextDirection: TextDirection.rtl, 
        
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        onSubmitted: (phone) {
          // ignore: avoid_print
          print(phone.toString());
        },
      ),
    );
  }
}
