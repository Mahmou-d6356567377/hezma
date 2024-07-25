import 'package:flutter/material.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
         height: 150,
        decoration: BoxDecoration(
          color:   const Color(darkwhite),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [ 
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color:  const Color.fromARGB(255, 187, 186, 186), 
              ),
              child: Row(children: [ 
                Expanded(
                flex: 1,
                child: Container(
                  decoration:   BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    gradient: const  LinearGradient(colors: [
                      Color(backgroundcustomgreen),
                      Color(backgroundcustomgreen2),
                    ])
                  ),
                  child: const Center(child:  Text('تطبيق', style: arabicstyle2,)),
                )),
               Expanded(
                flex: 4,
                 child: TextField( 
                  textDirection: TextDirection.rtl,
                  controller: controller,
                   decoration:  InputDecoration(
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    hintText: 'ادخل كوبون الخصم',
                    hintTextDirection: TextDirection.rtl,
                   ),
                 ),
               ),
               
              ],),
            ),
    
const  Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                  Row(
                      children: [ 
                      Text('ر.س', style: arabicstyle3,),
                      Text(' 20.00', style: arabicstyle3,),
                      ],
                    ),
                  Spacer(),
                  Text('قيمة المنتجات', style: arabicstyle2,),
                   
                ],
              ),
            ) ,     

               const  Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                  Row(
                      children: [ 
                      Text('ر.س', style: arabicstyle3,),
                      Text(' 20.00', style: arabicstyle3,),
                      ],
                    ),
                  Spacer(),
                  Text('ضريبه القيمه المضافه %15', style: arabicstyle2,),
                   
                ],
              ),
            )  , 
            const Divider() , 
              const  Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                  Row(
                      children: [ 
                      Text('ر.س', style: arabicstyle3,),
                      Text(' 20.00', style: arabicstyle3,),
                      ],
                    ),
                  Spacer(),
                  Text('المجموع', style: arabicstyle2,),
                   
                ],
              ),
            )  ,                      
          ],
        ),
      ),
    );
  }
}