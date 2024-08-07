import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/routes.dart';
import 'widgets/custom_scroll_view.dart';

class MainScrean1 extends StatefulWidget {
  const MainScrean1({super.key});

  @override
  State<MainScrean1> createState() => _MainScrean1State();
}

class _MainScrean1State extends State<MainScrean1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).push(AppRoutes.ns);
        }, icon: const Icon(Icons.notifications, color: Color(backgroundcustomgreen2),)),
        title: Center(child: Image.asset(klogomain)),
        actions: [ 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: GestureDetector(
              onTap: (){
                
              },
              child: Image.asset(kmainActionIcon)),
          ),
        ],
      ),
      body:  const custom_scroll_view(),
    );
  }
}