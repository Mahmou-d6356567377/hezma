import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         decoration: BoxDecoration(
         color: const  Color(darkwhite),
         borderRadius: BorderRadius.circular(17),
       ),
        child: TextFormField(
          controller: controller,
           validator: (value) {
              if (value == null || value.toString().isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: karabicFont1),
            alignLabelWithHint: true,
            hintTextDirection: TextDirection.ltr,
            prefixIcon: prefixIcon,
          ),
        ),
      ),
    );
  }
}
