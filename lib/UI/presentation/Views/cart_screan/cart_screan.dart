import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/custom_list_cart_item.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/switch_timing.dart';
import '../../../../utils/fonts.dart';
import 'widgets/details_container.dart';
import 'widgets/last_item_cart.dart';
import 'widgets/location_botton.dart';
import 'widgets/text_row.dart';

class MyCartScrean extends StatelessWidget {
  const MyCartScrean({super.key});

  @override
  Widget build(BuildContext context) {
  TextEditingController controller = TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: const Text('السله',style: arabicstyle2,),
      ),
    body:    CustomScrollView(
      slivers: <Widget>[
         const SliverToBoxAdapter(
          child:  CustomListItemCart(itmcount: 3),  
        ),
        SliverToBoxAdapter(
          child:  Column(
      children: [ 
        
        
        const TextRow(title: 'حدد عنوان التوصيل'),
        const LocatoinBotton(),
        const  TextRow(title : 'وقت التوصيل المفضل'),
        const SwitchTime(),
        DetailsContainer(controller: controller),
        const  TextRow(title : 'المجموع'),
        const Padding(
      padding:  EdgeInsets.all(16.0),
      child: LastItemCart(iscartscrean:  true,),
      
        )
      ]
      ),
    ),
      ]
    ),
    );
  }
}

