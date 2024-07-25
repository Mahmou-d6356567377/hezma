import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/fonts.dart';
import 'widgets/account_screan_content.dart';

class MyAccountScrean extends StatelessWidget {
  const MyAccountScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios_new), ),
        title: const Text('حسابى',style: arabicstyle2,),
        centerTitle: true,
      ),
      body: const  AccountScreanContent(),
    );
  }
}

