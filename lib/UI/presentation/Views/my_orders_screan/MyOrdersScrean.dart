import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/modfiy_account_screan/widgets/custom_couple_botton.dart';
import 'package:hezma/UI/presentation/Views/my_orders_screan/widgets/order_item.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

class MyOrderScrean extends StatelessWidget {
  const MyOrderScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('طلباتى'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics:  const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => const OrderItem()),
          ), 
           SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
              decoration: customBoxDecoration.copyWith( border:  Border.all()),
                child: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ 
                      Text('ر.س', style: arabicstyle2,),
                       Text('69', style: arabicstyle4,),
                      Spacer(),
                      Text('مجموع السعر بعد الضريبة', style: arabicstyle2,),
                     
                    ],
                  ),
                ),
              ),
            ) ,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 120,),
          ),
           SliverToBoxAdapter(
            child: CustomCoupleBotton(title1: 'تتبع', title2: 'الغاء الطلب',
             ontap1: (){
             GoRouter.of(context).push(AppRoutes.fs);
            },
            ontap2: (){
             GoRouter.of(context).pop();
            },),
          ),
           const SliverToBoxAdapter(
            child: SizedBox(height: 50,),
          ),
        ],
      ),

    );
  }
}