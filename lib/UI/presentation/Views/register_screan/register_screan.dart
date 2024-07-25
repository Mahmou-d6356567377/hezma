import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/customTextField.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/customphoneTxtField.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/passwordTxTfield.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';
import 'widgets/arabicTXT.dart';

class RegisterScrean extends StatefulWidget {
  const RegisterScrean({super.key});

  @override
  State<RegisterScrean> createState() => _RegisterScreanState();
}

class _RegisterScreanState extends State<RegisterScrean> {
  bool checkphone = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
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
                  flex: 4,
                  child: Stack(
                    children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 12),
                         child: IconButton(onPressed: (){
                          GoRouter.of(context).push(AppRoutes.rs);
                        }, icon:const  Icon(Icons.arrow_back_ios, color: Color(backgroundcolor1),)),
                       ),
                      SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(kLogo2),
                    ),
                    ]
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
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(kregisterword),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          checkphone = !checkphone;
                                        });
                                      },
                                      child: checkphone ? Image.asset(kwhitegmail) : Image.asset(kgreenmail),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          checkphone = !checkphone;
                                        });
                                      },
                                      child: checkphone ? Image.asset(kgreenphone) : Image.asset(kwhitephone),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            checkphone
                                ? CustomIntlPhoneField(
                                    hintText: 'رقم الجوال',
                                    controller: phonecontroller,
                                  )
                                : CustomTextField(
                                    hintText: 'البريد الاكترونى',
                                    prefixIcon: const Icon(Icons.mail),
                                    controller: emailController,
                                  ),
                            PasswordTextField(
                              hintText: 'الرقم السرى',
                              controller: passwordController,
                            ),
                            const Arabictext(arabicText: 'هل نسيت الرقم السري ؟'),
                           const SizedBox(height: 100,),
                            const Arabictext(arabicText: 'بتسجيك فى الحزمه فانت توافق فى سياسة الخصوصيه'),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {

                                  if (_formKey.currentState!.validate()) {

                                    GoRouter.of(context).push(AppRoutes.acs);
                                   ScaffoldMessenger.of(context).showSnackBar(
                                     const SnackBar(content: Text('Processing Data')),
                                   );
                                 }
  
                                },
                                child: Image.asset(kEnterButtom),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).push(AppRoutes.bas);
                                  },
                                  child: const Text('انشاء حساب', style: arabicstyle),
                                ),
                                const Arabictext(arabicText: 'هل انت جديد فى الحزمه'),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(AppRoutes.cpns);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text('دخول بدون حساب', style: arabicstyle),
                              ),
                            ),
                          ],
                        ),
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
