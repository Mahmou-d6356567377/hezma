import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/models/my_account_screan_models/profile/data.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/register_screan/widgets/customTextField.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/register_screan/widgets/customphoneTxtField.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/modfiy_account_screan/widgets/custom_couple_botton.dart';
import 'package:hezma/blocs/my_account_cubits/profile_cubit/profile_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/update_profile_cubit/updata_cubit_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

class ModifyAccountScrean extends StatelessWidget {
  ModifyAccountScrean({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          'تعديل الحساب',
          style: arabicstyle2,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ProfileData profileData1;
          if (state is ProfileSuccess) {
            profileData1 = state.profileData;
            if (emailController.text.isEmpty) {
              emailController.text = profileData1.email!;
            }
            if (phonecontroller.text.isEmpty) {
              phonecontroller.text = profileData1.phone!;
            }
            if (nameController.text.isEmpty) {
              nameController.text = profileData1.name!;
            }
            ;
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'الاسم',
                        prefixIcon: const Icon(
                          Icons.edit,
                          color: Color(backgroundcustomgreen),
                        ),
                        controller: nameController,
                      ),
                      CustomIntlPhoneField(
                        hintText: 'رقم الجوال',
                        controller: phonecontroller,
                      ),
                      CustomTextField(
                        hintText: 'البريد الاكترونى',
                        prefixIcon: const Icon(
                          Icons.edit,
                          color: Color(backgroundcustomgreen),
                        ),
                        controller: emailController,
                      ),
                      CustomTextField(
                        hintText: 'الرقم السرى',
                        controller: passwordController,
                        prefixIcon: const Icon(
                          Icons.edit,
                          color: Color(backgroundcustomgreen),
                        ),
                      ),
                      const SizedBox(height: 80),
                      BlocConsumer<UpdataProfileCubit, UpdataCubitState>(
                        listener: (context, state) {
                          if (state is UpdataCubitSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.succMsg)));
                          } else if (state is UpdataCubitFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errMsg)));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: LinearProgressIndicator()));
                          }
                        },
                        builder: (context, state) {
                          return CustomCoupleBotton(
                            title1: 'حفظ',
                            title2: 'الغاء',
                            ontap1: () {
                              context
                                  .read<UpdataProfileCubit>()
                                  .updateProfileData(
                                      name: nameController.text,
                                      phone: phonecontroller.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                              GoRouter.of(context).pop();
                              context.read<ProfileCubit>().fetchProfileData();
                            },
                            ontap2: () {
                              GoRouter.of(context).pop();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
