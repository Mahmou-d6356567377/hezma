import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const PasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
     bool notsecure  = false ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
         validator: (value) {
            if (value == null || value.toString().isEmpty) {
              return 'Please enter Your password';
            }
            return null;
          },
        obscureText: !notsecure,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          hintText: widget.hintText,
          alignLabelWithHint: true,
          
          hintTextDirection: TextDirection.ltr,
          prefixIcon: notsecure ?  IconButton(onPressed: (){
            setState(() {
              notsecure= !notsecure;
            });
          }, icon:  const Icon(Icons.visibility)) : 
          IconButton(onPressed: (){
            setState(() {
              notsecure= !notsecure;
              
            });
          }, icon: const Icon(Icons.visibility_off)),
        ),
      ),
    );
  }
}
