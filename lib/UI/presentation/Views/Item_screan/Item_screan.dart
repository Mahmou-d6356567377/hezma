import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/Kesm_Khdar_screan/widgets/customGridView2.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

import 'widgets/counter_widget.dart';

class ItemScrean extends StatelessWidget {
  const ItemScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [ 
          SizedBox(
              height: 160,
             
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Image.asset(kitmimg , fit:  BoxFit.fill,),
                ],
              ),
            ), 
             Row(
                       mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('جزر', style: arabicstyle2.copyWith(fontSize: 25 ),),
              ],
                         ),
        
                Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [ 
                    const CounterWidget(),
                    const Spacer(),
                     PannableRatingBar(   
                             rate: 2.5,                           
                             items: List.generate(5, (index) =>
                               const RatingWidget(                             
                                 selectedColor: Colors.grey,
                                 unSelectedColor: Colors.green,
                                 child: Icon(
                                   Icons.star,
                                   size: 20,
                                 ),
                               )
                               ),
                            
                 ),],
                 ),
            
                  Row(    
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [       
                        Text('ر.س/كجم', style: arabicstyle2.copyWith(fontSize: 20),),
                        Text(' 20.00', style: arabicstyle3.copyWith(fontSize: 20),),
                     
                      ],
                    ),
           


                 Padding(
                   padding: const EdgeInsets.only(left: 15 , bottom: 20 , top: 20),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                     Text('مزيد من التفاصيل',style: arabicstyle3.copyWith(fontSize: 15),),
                     ],
                     ),
                  Text('ان الجزر من الخضروات الجزريه و يكون له الوان مختلفه تنوعا من البرتقالى العادى الى الاسود والارجوانى وكذلك الاحمر والاصفر والابيض ان الجزر الذى يتم تنتاجه فى الوقت الحالى ',
                  style: arabicstyle2.copyWith(fontSize: 13),
                  maxLines: 2,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),

             Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text('مزيد من المنتجات',style: arabicstyle3.copyWith(fontSize: 15),),
               ],
             ),
          const  Expanded(
            child: customGridView2()
           ),
           Container(
            decoration: BoxDecoration(
              boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8), // Shadow color
                spreadRadius: 3, 
                blurRadius: 7, 
                offset: const  Offset(0, 3),
              ),
              ],
            
              color: const Color(backgroundcolor1),
              borderRadius: BorderRadius.circular(17),
            ),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(

                  onTap: (){


                  },
                  child: GestureDetector(
                    onTap: (){
                    showDialog(context: context,
                     builder: (_)=>   AlertDialog(
                       actions: <Widget>[
                       Center(child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                         child: Image.asset(kcarticon),
                       )),
                       const Padding(
                         padding:  EdgeInsets.all(8.0),
                         child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('تمت اضافة المنتج الى السله' , style: arabicstyle3,),
                           ],
                         ),
                       ),
                       ],
                        surfaceTintColor: const Color(backgroundcolor1),
                        shadowColor: Colors.black26,
                      ),
                      );
                    },
                    child: Stack(
                      children: [ 
                       Image.asset(krecaddcart),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                         child: Image.asset(kaddcart),
                       ),
                      ],
                    ),
                  ),
                ),
              ),
              const  Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [ 
                 const  Text('مجموع السعر', style: arabicstyle2,),
                   Row(    
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [       
                            Text('ر.س/كجم', style: arabicstyle2.copyWith(fontSize: 15),),
                            Text(' 20.00', style: arabicstyle3.copyWith(fontSize: 15),),
                          ],
                        ),
                             
                  ],
                ),
              ), 
             
              ],
             ),
           ),
          ],
        ),
      ),
    );
  }
}

