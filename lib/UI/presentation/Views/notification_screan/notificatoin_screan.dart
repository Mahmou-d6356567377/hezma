import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/fonts.dart';
import 'widgets/custom_list_notification.dart';

class  NotificationScrean extends StatelessWidget{
  const NotificationScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios , color: Colors.black,)),
        centerTitle: true,
         title: const Text('الاشعارات',style: arabicstyle2,),
      ),

      body: const CustomListNotification(),
    );
  }
}