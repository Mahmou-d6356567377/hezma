import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/register_screan/widgets/arabicTXT.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/register_screan/widgets/customTextField.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/register_screan/widgets/customphoneTxtField.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/register_screan/widgets/passwordTxTfield.dart';
import 'package:hezma/blocs/auth_cubits/register_cubit/register_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void _submitForm() async {
    if (confirmpasswordController.text != passwordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('تاكيد كلمه المرور ليس مثل كلمه المرور'),
            ],
          ),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> body = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "fcm":
            'd-G53x4dQCKm0IA3qS3cUb:APA91bFTsbA-ZQE-PF4v0hwUY-LV09ecPg9jjJrkJLAWPLavIxiMG5CDiF7XXHmc55bVpscMVDPLtnOVrvHACM__MDX5cDqVVgonhgtZXMVbJIMlegJThJ6nEoSKeO3rfefKv4z32kgH', // Pass the token
      };

      context.read<RegisterCubit>().fetchRegisterdata(body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Registersuccess) {
            print(state.logindata1.otp);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration successful')),
            );
            GoRouter.of(context).push(AppRoutes.acs);
          } else if (state is Registerfailure) {
            print(state.errMsg);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMsg)),
            );
          }
        },
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
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Color(backgroundcolor1),
                              ),
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
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
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
                                  controller: phoneController,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [Arabictext(arabicText: 'أو')],
                                ),
                                CustomTextField(
                                  isEmail: true,
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
                                const Arabictext(
                                  arabicText:
                                      'بتسجيك فى الحزمه فانت توافق فى سياسةالخصوصيه',
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8),
                                  child: GestureDetector(
                                    onTap: _submitForm,
                                    child: state is Registerloading
                                        ? const CircularProgressIndicator()
                                        : Image.asset(kRegisterButton),
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
          );
        },
      ),
    );
  }
}
