import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    super.key,
     required this.pinController, 
  }) ;

  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
                 return PinCodeTextField(
                  controller: pinController,
                  length: 4,
                  appContext: context,
                  onChanged: (value) {
                    // Handle changes
                  },
                  onCompleted: (value) {
                    // Handle completion
                    print('Entered code: $value');
                  },
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.grey,
                  ),
                );
  }
}
