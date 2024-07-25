import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/constants.dart';

import '../../../../utils/fonts.dart';

class PrivacyRulesScrean extends StatelessWidget {
  const PrivacyRulesScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios),),
        title: const Text('سياسة الخصوصيه', style: arabicstyle2,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [ 
              Image.asset(kprivacytxt),
            ],
          ),
        ),
      ),
    );
  }
}