import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:hezma/utils/fonts.dart';

import '../../../../../utils/constants.dart';

class ListItem1 extends StatefulWidget {
  const ListItem1({
    super.key,
  });

  @override
  State<ListItem1> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem1> {
   double rating = 0.5;
  @override
  Widget build(BuildContext context) {
    return Container( 
          decoration:   BoxDecoration(
    borderRadius: BorderRadius.circular(18),
     color: const  Color(0xffF0F0F0),
          ),
          child: Row(
     children: [ 
        Expanded(
          flex: 4,
       child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
         children: [ 
           const Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('البرتقال', style: arabicstyle2,),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Text(' متوفر', style: arabicstyle3.copyWith(fontSize:20 ),),
               
                ],
              ),
         ],
       )),
      Expanded(
        flex: 3,
       child: Container(
         decoration: BoxDecoration(
          border: Border.all(color: const Color(backgroundcustomgreen)),
           borderRadius: BorderRadius.circular(18),
         color: const Color(backgroundcolor1),
         ),
         child: Stack(
         children: [
           
           Align(
             alignment: Alignment.center,
             child: Image.asset(konrange)),
            
         ],
                  ),
       )
                ),
    
     ],
          ),
        );
  }
}