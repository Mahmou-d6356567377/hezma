
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/counter_widget2.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
     decoration:   BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const  Color(darkwhite),
        ),
    
        child: Row(
          children: [ 
              const  Expanded(
              flex: 3,
              child:  Padding(
                padding: EdgeInsets.all(8.0),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                             children: [ 
                  Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Text('البرتقال', style: arabicstyle2,),
                   ],
                 ),
                  
                   Padding(
                     padding: EdgeInsets.symmetric(vertical: 4.0),
                     child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                      CounterWidget2(),
                         Spacer(),
                         Text('فواكه', style: TextStyle(
                          fontFamily: karabicFont1,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 106, 106, 106)
                         ),),
                     ],
                          ),
                   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ 
                    Text('ر.س/كجم', style: arabicstyle2,),
                    Text(' 20.00', style: arabicstyle3,),
                    ],
                  ),
                             ],
                           ),
              ),
            ),
            
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                   decoration:   BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const  Color(backgroundcolor1),
                            ),
                  child: Image.asset(konrange)),
              ),
            ),

         
          ],
        ),
    );
  }
}