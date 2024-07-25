
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hezma/UI/presentation/Views/my_orders_screan/widgets/location_widget.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
       decoration: customBoxDecoration,
      
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
                    
                     Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text('فواكه', style: arabicstyle3,),
                     ],
                   ),
                    Row(    
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [ 
                        LocationWidgetOrder(),
                         Spacer(),
                        
                        Row(
                          children: [ 
                          Text('ر.س/كجم', style: arabicstyle2,),
                          Text(' 20.00', style: arabicstyle3,),
                          ],
                        ),
                          
                       
                        ],
                      ),
                               ],
                             ),
                ),
              ),
              
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}