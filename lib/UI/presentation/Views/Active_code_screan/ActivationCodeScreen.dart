import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/Active_code_screan/widgets/custom_timer_button.dart';
import 'package:hezma/UI/presentation/Views/Active_code_screan/widgets/pin_code_text_field.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/routes.dart';
import '../register_screan/widgets/arabicTXT.dart';

class ActivationCodeScreen extends StatefulWidget {
  const ActivationCodeScreen({super.key});

  @override
  State<ActivationCodeScreen> createState() => _ActivationCodeScreenState();
}

class _ActivationCodeScreenState extends State<ActivationCodeScreen> {
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(backgroundcustomgreen2),
                  Color(backgroundcustomgreen),
                ],
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios, color: Color(backgroundcolor1)),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(kLogo2),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Image.asset(krectangle, fit: BoxFit.fill),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(kEnteractivecode),
                              ],
                            ),
                          ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset(kpleaseenteractivecode),
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 80.0),
                             child: CustomPinCodeTextField(pinController: _pinController),
                           ),
                           
                          const Spacer(),
                          const Arabictext(arabicText: 'بتسجيك فى الحزمه فانت توافق فى سياسةالخصوصيه'),
                         const Timer_button(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50.0, left: 8, right: 8, top:8 ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(kactiveCodeButton),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

