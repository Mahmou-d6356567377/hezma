import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/location_botton.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/text_row.dart';
import 'package:hezma/utils/constants.dart';
import '../../../../utils/fonts.dart';
import 'widgets/address_widget.dart';

class AdressesScrean extends StatelessWidget {
  const AdressesScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios),),
        title: const Text('العناوين', style: arabicstyle2,),
        centerTitle: true,
      ),
      body:  Column(
        children: [ 
          const  TextRow(title: 'تحديد على الخريطة'),
          const  LocatoinBotton(),
          const  TextRow(title: 'العناوين المستخدم التوصيل'),
          const Row(
            children: [
              Expanded(child: Padding(
                padding:  EdgeInsets.all(12.0),
                child: AddressItem(),
              )),
             
             Expanded(child: Padding(
                padding:  EdgeInsets.all(12.0),
                child: AddressItem(),
              )),
              Expanded(child: Padding(
                padding:  EdgeInsets.all(12.0),
                child: AddressItem(),
              )),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset (1,1) ,

                  ),
                ],
              ),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Image.asset(kmapIMG , fit: BoxFit.fill,)),
                 const  Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Icon(Icons.location_on,color: Color(backgroundcustomgreen2),),
                      Spacer(),
                      Column(
                        children: [
                          Text('العناوين المستخدم التوصيل', style: TextStyle(
                            color: Color(backgroundcustomgreen),
                          ),),
                           Text('الرحمانيه ,الرياض ,السعودية', style: arabicstyle2),
                        ],
                      ),
                     
                    ],
                  ),
                  ),
              ],
            
            ),
            ),
          )
        ],
      ),
    );
  }
}

