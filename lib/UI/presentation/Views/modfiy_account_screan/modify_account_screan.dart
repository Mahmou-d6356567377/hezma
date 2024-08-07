import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/modfiy_account_screan/widgets/custom_couple_botton.dart';
import 'package:hezma/utils/fonts.dart';

import '../../../../utils/constants.dart';
import '../register_screan/widgets/customTextField.dart';
import '../register_screan/widgets/customphoneTxtField.dart';

class ModifyAccountScrean extends StatelessWidget {
  ModifyAccountScrean({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                title: const  Text('تعديل الحساب', style: arabicstyle2,),
                centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Form(
              key: _formKey,
              child: Column(
                children: [
               
                  CustomTextField(
                    hintText: 'الاسم',
                    prefixIcon: const Icon(Icons.edit, color: Color(backgroundcustomgreen),),
                    controller: nameController,
                  ),
                  CustomIntlPhoneField(
                    hintText: 'رقم الجوال',
                    controller: phonecontroller,
                  ),
                 
                  CustomTextField(
                    hintText: 'البريد الاكترونى',
                    prefixIcon: const Icon(Icons.edit, color: Color(backgroundcustomgreen),),
                    controller: emailController,
                  ),
                  CustomTextField(
                    hintText: 'الرقم السرى',
                    controller: passwordController,
                    prefixIcon: const Icon(Icons.edit, color: Color(backgroundcustomgreen),),
                  ),
                  const SizedBox(height: 80),
                 
                   CustomCoupleBotton(title1: 'حفظ', title2: 'الغاء' , 
                  ontap1: (){
        
                  },
                  ontap2: () {
                    
        
                  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

