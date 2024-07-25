import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

import '../../../../../utils/constants.dart';

class listItem extends StatefulWidget {
  const listItem({
    super.key,
  });

  @override
  State<listItem> createState() => _listItemState();
}

class _listItemState extends State<listItem> {
  bool isfavorite = false;
   double rating = 0.5;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRoutes.kIIs);
      },
      child: Container( 
            decoration:   BoxDecoration(
            borderRadius: BorderRadius.circular(18),
       color: const  Color(0xffF0F0F0),
            ),
            child: Column(
       children: [ 
        Expanded(
         flex: 2,
         child: Padding(
           padding: const  EdgeInsets.all(8.0),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(18),
             color: const Color(backgroundcolor1),
             ),
             child: Stack(
             children: [
               
               Align(
                 alignment: Alignment.center,
                 child: Image.asset(konrange)),
                 Stack(
                   children: [
                    IconButton(onPressed: (){
                     setState(() {
                      isfavorite = !isfavorite ;
                     });
                    }, icon: Icon(Icons.favorite, color: isfavorite ?  Colors.red : const  Color.fromARGB(255, 222, 217, 217),))
                   ],
                 ),
             ],
                      ),
           ),
         )
                  ),
        Expanded(
         flex: 1,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8.0),
           child: Column( 
             children: [ 
               const Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text('البرتقال', style: arabicstyle2,),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [ 
                   PannableRatingBar(   
                           rate: rating,                           
                           items: List.generate(5, (index) =>
                             const RatingWidget(                             
                               selectedColor: Colors.green,
                               unSelectedColor: Color(backgroundcolor1),
                               child: Icon(
                                 Icons.star,
                                 size: 15,
                               ),
                             )
                             ),
                           onChanged: (value) { 
                             setState(() {
                               rating = value;
                             });
                           },
                          
               ),],
               ),
          
                Row(    
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ 
                        IconButton(onPressed: (){
      
                     }, icon: const Icon(Icons.shopping_cart, color: Color(backgroundcustomgreen2),)),
                    const Spacer(),
      
                     const Text('ر.س/كجم', style: arabicstyle2,),
                     const Text(' 20.00', style: arabicstyle3,),
                   
                    ],
                  ),
             ],
           ),
         )),
       ],
            ),
          ),
    );
  }
}