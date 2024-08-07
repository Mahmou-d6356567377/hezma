import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/Kesm_Khdar_screan/widgets/customGridView2.dart';
import 'package:hezma/utils/fonts.dart';



class KesmfakhScrean extends StatelessWidget{
  const KesmfakhScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios , color: Colors.black,)),
        centerTitle: true,
         title: const Text('قسم فواكه',style: arabicstyle2,),
      ),

      body: const Column(
        children: [ 
           
         Expanded(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomGridView2(),
        )),
        ],
      ),
    );
  }
}

