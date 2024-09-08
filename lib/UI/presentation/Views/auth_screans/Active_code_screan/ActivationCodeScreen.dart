import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/Active_code_screan/widgets/custom_timer_button.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/Active_code_screan/widgets/pin_code_text_field.dart';
import 'package:hezma/blocs/auth_cubits/otp_cubit/otp_cubit.dart';
import 'package:hezma/blocs/auth_cubits/receive_otp_cubit/receive_otp_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../register_screan/widgets/arabicTXT.dart';

class ActivationCodeScreen extends StatefulWidget {
  const ActivationCodeScreen({super.key});

  @override
  State<ActivationCodeScreen> createState() => _ActivationCodeScreenState();
}

class _ActivationCodeScreenState extends State<ActivationCodeScreen> {
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? otpFromState;

  Future<void> _saveLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<OtpCubit, OtpState>(
            listener: (context, state) {
              if (state is OtpSuccess) {
                _saveLoginStatus();
                otpFromState = state.otp.otp;
                print(otpFromState);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 30),
                  content: Text('OTP: $otpFromState'),
                ));
              } else if (state is OtpLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      content: Center(
                        child: CircularProgressIndicator(),
                      ),
                      title: Text('جارى التحميل'),
                    );
                  },
                );
              } else if (state is OtpFailure) {
                Navigator.of(context).pop(); // Close the dialog if it’s open
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('حدث خطأ')),
                );
              }
            },
          ),
          BlocListener<ReceiveOtpCubit, ReceiveOtpState>(
            listener: (context, state) {
              if (state is ReceiveOtpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('OTP Received: ${state.receivedMsg}')),
                );
              } else if (state is ReceiveOtpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.errorMSG}')),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<OtpCubit, OtpState>(
          builder: (context, state) {
            return Stack(
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
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: Color(backgroundcolor1)),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: CustomPinCodeTextField(
                                      pinController: _pinController),
                                ),
                                const Spacer(),
                                const Arabictext(
                                    arabicText:
                                        'بتسجيك فى الحزمه فانت توافق فى سياسةالخصوصيه'),
                                const Timer_button(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 50.0, left: 8, right: 8, top: 8),
                                  child: GestureDetector(
                                    onTap: () async {
                                      print('tapped on the active code button');
                                      if (_pinController.text == otpFromState) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Center(
                                              child: Text('كود التفعيل  صحيح'),
                                            ),
                                          ),
                                        );
                                        // Call receiveOtp function
                                        context
                                            .read<ReceiveOtpCubit>()
                                            .receiveOtp(
                                                otp1: _pinController.text);

                                        GoRouter.of(context)
                                            .push(AppRoutes.cpns);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Center(
                                              child:
                                                  Text('كود التفعيل غير صحيح'),
                                            ),
                                          ),
                                        );
                                      }
                                    },
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
            );
          },
        ),
      ),
    );
  }
}
