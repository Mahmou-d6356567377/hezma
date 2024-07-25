

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/main_screan1/widgets/custom_list_view.dart';
import 'package:hezma/utils/routes.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class custom_scroll_view extends StatelessWidget {
  const custom_scroll_view({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                   children: [ 
           GestureDetector(
          onTap: (){
          
          },
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 20.0, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRoutes.ks);
                  },
                  child: Image.asset(kfrstimgmain,fit: BoxFit.fill,))),
              ],
            ),
          )
          ),
          const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [ Text('الاقسام',style: arabicstyle1,)],),
          ),
          
          SizedBox(
            height: 80,
            child: Row(children: [ 
           Expanded(child: GestureDetector(
            onTap: (){
             GoRouter.of(context).push(AppRoutes.ks1);
            },
            child: Image.asset(khdaricon))),
           Expanded(child: GestureDetector(
            onTap: (){
             GoRouter.of(context).push(AppRoutes.ks3);
            },
            child: Image.asset(kfakhIcon))),
           Expanded(child: GestureDetector(
            onTap: (){
             GoRouter.of(context).push(AppRoutes.ks2);
            },
            child: Image.asset(kwaterIcon))),
          ],),
          ),
            Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [ 
              GestureDetector(
                onTap: (){
                    GoRouter.of(context).push(AppRoutes.ks);
                },
                child: const Text('الكل',style: arabicstyle1,)),
              const Spacer(),
              const Text('المنتجات',style: arabicstyle1,),
              

              ],),
          ),
          
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.0),
            child: customGridView(),
          ),
          ],
                ),
        ),
      ],
    );
  }
}
