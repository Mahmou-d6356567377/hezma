import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';
import '../../../../../utils/constants.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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
            child: Stack(
              children: [
               Positioned(
                  bottom: 1,
                  left: 0,
                  child:  Container(
                    decoration: const BoxDecoration(
                      color: Color(backgroundcustomgreen),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17)),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(5.0),
                      child:  Icon(Icons.shopping_cart, color: Color(backgroundcolor1,),size: 25,),
                    ),
                    ),
                    ),
                Column(
                     children: [ 
                      Expanded(
                       flex: 2,
                       child: Padding(
                         padding: const  EdgeInsets.all(5.0),
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
              
                  
                   Positioned(
                    top: -5,
                    left: -5,
                     child: Stack(
                      alignment: Alignment.center,
                      children: [ 
                         CircleAvatar(
                      radius: 15,
                      backgroundColor:  isfavorite ?  const  Color.fromARGB(255, 189, 237, 121) : const Color(backgroundcustomgreen),
                     ),
                     IconButton(onPressed: (){
                        setState(() {
                         isfavorite = !isfavorite ;
                        });
                       }, icon: Icon(Icons.favorite, color: isfavorite ? const  Color(backgroundcustomgreen2) : const Color(backgroundcolor1)),),
                      ],
                     ),
                   ),
               ],
                        ),
                         ),
                       )
                    ),
                      Expanded(
                       flex: 1,
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
                    textDirection: TextDirection.rtl,
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
                                       
                      Text('ر.س/كجم', style: arabicstyle2.copyWith(fontSize: 11) ,),
                      Text(' 20.00', style: arabicstyle3.copyWith(fontSize: 11),),
                   
                    ],
                  ),
                         ],
                       )),
                     
                     
                     //
                     ],
              ),
              
              ],
            ),
          ),
    );
  }
}