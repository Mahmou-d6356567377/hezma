import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/passwordTxTfield.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/arabicTXT.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/customTextField.dart';
import 'package:hezma/UI/presentation/Views/register_screan/widgets/customphoneTxtField.dart';

class BuildAccountScrean extends StatefulWidget {
  const BuildAccountScrean({super.key});

  @override
  State<BuildAccountScrean> createState() => _BuildAccountScreanState();
}

class _BuildAccountScreanState extends State<BuildAccountScrean> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmpasswordController = TextEditingController();
    final TextEditingController phonecontroller = TextEditingController();
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
                      IconButton(onPressed: (){
                      GoRouter.of(context).pop();
                    }, icon:const  Icon(Icons.arrow_back_ios, color: Color(backgroundcolor1),)),
                    ],
                  ),
                )),
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
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(kBuildaccountText),
                                ],
                              ),
                            ),
                            CustomTextField(
                              hintText: 'الاسم',
                              prefixIcon: const Icon(Icons.handshake),
                              controller: nameController,
                            ),
                            CustomIntlPhoneField(
                              hintText: 'رقم الجوال',
                              controller: phonecontroller,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Arabictext(arabicText: 'أو')],
                            ),
                            CustomTextField(
                              hintText: 'البريد الاكترونى',
                              prefixIcon: const Icon(Icons.mail),
                              controller: emailController,
                            ),
                            PasswordTextField(
                              hintText: 'الرقم السرى',
                              controller: passwordController,
                            ),
                            PasswordTextField(
                              hintText: 'تاكيد الرقم السري',
                              controller: confirmpasswordController,
                            ),
                            const SizedBox(height: 80),
                            const Arabictext(arabicText: 'بتسجيك فى الحزمه فانت توافق فى سياسةالخصوصيه'),




                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 8),
                              child: GestureDetector(


                                onTap: () async {

                                 try {
                                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                       email: emailController.text,
                                       password: passwordController.text,
                                     );
                                   } on FirebaseAuthException catch (e) {
                                     if (e.code == 'weak-password') {
                                       // ignore: avoid_print
                                       print('The password provided is too weak.');
                                     } else if (e.code == 'email-already-in-use') {
                                       // ignore: avoid_print
                                       print('The account already exists for that email.');
                                     }
                                   } catch (e) {
                                     // ignore: avoid_print
                                     print(e);
                                   }
                                },


                                child: Image.asset(kRegisterButton),
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
