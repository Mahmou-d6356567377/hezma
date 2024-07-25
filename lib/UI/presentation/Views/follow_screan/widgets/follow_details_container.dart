import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';

import '../../../../../utils/fonts.dart';

class FollowDetailsContainer extends StatelessWidget {
  const FollowDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Container(
        decoration: customBoxDecoration,
        child:  Column(
          children: [ 
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                  Text('(43454)', style: arabicstyle4,),
                  Text('تتبع توصيل طلبك رقم', style: arabicstyle2,),
                ],
              ),
            ),
            const  Padding(
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
             const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                  Text(' 5:00 ', style: arabicstyle6,),
                  Text('الى', style: arabicstyle2,),
                  Text(' 4:30 ', style: arabicstyle6,),
                  Text('بين الوقت', style: arabicstyle2,),
                  Text(' 30/7/2024 ', style: arabicstyle6,),
                  Text('الوقت المتوقع الوصول فيه', style: arabicstyle2,),
                ],
              ),
            ),
           
            Padding(
              padding: const  EdgeInsets.all(8.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                    Column(
                      children: [
                        Image.asset(kgreenwhitecircle,width: 30,),
                        const Text('تسليم الطلب', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),),
                      ],
                    ),
                    Image.asset(kline, width: 40,),
                     Column(
                      children: [
                        Image.asset(kgreenwhitecircle,width: 30,),
                        const Text('توصيل الطلب', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),),
                      ],
                    ),
                    Image.asset(kline, width: 40,),
                     Column(
                      children: [
                        Image.asset(kgreenwhitecircle,width: 30,),
                        const Text('تجهيز الطلب', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),),
                      ],
                    ),
                    Image.asset(kline, width: 40,),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [ 
                              Image.asset(kgreencircle,width: 30,),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 5),
                                child: Image.asset(kvector,width: 20,),
                              ),
                            
                            ],
                          ),
                        ),
                         const  Text('استلام الطلب', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}