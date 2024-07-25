import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/my_account_screan/widgets/my_account_item.dart';
import 'package:hezma/utils/routes.dart';

import '../../../../../utils/constants.dart';

class AccountScreanContent extends StatelessWidget {
  const AccountScreanContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(klogo, height: 200,),
            MyAccountItem(title: 'تعديل الحساب', icon: const Icon(Icons.person, color: Color(backgroundcustomgreen),), ontap: (){
              GoRouter.of(context).push(AppRoutes.mas);
            }),
            MyAccountItem(title: 'طلباتى', icon: const Icon(Icons.file_present, color: Color(backgroundcustomgreen),), ontap: (){
              GoRouter.of(context).push(AppRoutes.mos);
            }),
            MyAccountItem(title: 'العناوين', icon: const Icon(Icons.location_on, color: Color(backgroundcustomgreen),), ontap: (){
              GoRouter.of(context).push(AppRoutes.ads);
            }),
            MyAccountItem(title: 'الدفع', icon: const Icon(Icons.payment, color: Color(backgroundcustomgreen),), ontap: (){
             GoRouter.of(context).push(AppRoutes.pms2);
            }),
            MyAccountItem(title: 'الدعم الفنى', icon: const Icon(Icons.supervised_user_circle, color: Color(backgroundcustomgreen),), ontap: (){
             GoRouter.of(context).push(AppRoutes.tss);
            }),
            MyAccountItem(title: 'سياسة الخصوصيه', icon: const Icon(Icons.privacy_tip, color: Color(backgroundcustomgreen),), ontap: (){
                           GoRouter.of(context).push(AppRoutes.prs);
            }),
            MyAccountItem(title: 'الشروط والاحكام', icon: const Icon(Icons.article, color: Color(backgroundcustomgreen),), ontap: (){
                           GoRouter.of(context).push(AppRoutes.rs2);
            }),
            MyAccountItem(title: 'تسجيل خروج', icon: const Icon(Icons.logout, color: Color(backgroundcustomgreen),), ontap: (){}),
          ],
        ),
      ),
    );
  }
}

