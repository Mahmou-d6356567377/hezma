import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      body: Column(
        children: [ 
          Image.asset(kfollowImg,width: double.infinity, fit: BoxFit.fill,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Container(
                decoration: customBoxDecoration,
                child: const Column(
                  children: [ 
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [ 
                          Text('(43454)', style: arabicstyle4,),
                          Text('تتبع توصيل طلبك رقم', style: arabicstyle2,),
                        ],
                      ),
                    ),
                     Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [ 
                        Expanded(
                          child: Column(
                            children: [
                              Text('حالة الطلب', style: arabicstyle4,),
                            Text('قيد التنفيذ', style: arabicstyle2,),
                            ],
                          ),
                        ),
                            Expanded(
                              child: Column(
                                children: [
                              Text('عدد الاصناف', style: arabicstyle4,),
                             Text('اصناف3', style: arabicstyle2,),
                              ],
                             ),
                            ),
                            Expanded(
                              child: Column(
                                                        children: [
                              Text('تاريخ الطلب', style: arabicstyle4,),
                                                        Text('20/07/2024', style: arabicstyle2,),
                                                        ],
                                                      ),
                            ),
                        ],
                      ),
                    ),
                     Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [ 
                          Text(' 5:00 ', style: arabicstyle4,),
                          Text('الى', style: arabicstyle2,),
                          Text(' 4:30 ', style: arabicstyle4,),
                          Text('بين الوقت', style: arabicstyle2,),
                          Text(' 30/7/2024 ', style: arabicstyle4,),
                          Text('الوقت المتوقع الوصول فىيه', style: arabicstyle2,),
                        ],
                      ),
                    ),
                  
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}