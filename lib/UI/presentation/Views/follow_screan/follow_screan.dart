import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/follow_screan/widgets/follow_details_container.dart';
import 'package:hezma/UI/presentation/Views/follow_screan/widgets/last_follow_container.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class FollowScrean extends StatelessWidget {
  const FollowScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios),),
        title: const Text('تتبع', style: arabicstyle2,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [ 
              Container(
                decoration: customBoxDecoration,
                child: Image.asset(kfollowImg,width: double.infinity, fit: BoxFit.fill,)),
              const FollowDetailsContainer(),
              const  LastFollowContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

