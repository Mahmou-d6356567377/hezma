

  import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
  import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
  import 'package:flutter/material.dart';
  import 'package:go_router/go_router.dart';
  import 'package:hezma/UI/presentation/Views/cart_screan/cart_screan.dart';
  import 'package:hezma/UI/presentation/Views/favorite_screan/favorite_screan.dart';
  import 'package:hezma/UI/presentation/Views/main_screan1/main_screan1.dart';
  import 'package:hezma/UI/presentation/Views/my_account_screan/my_account_screan.dart';
import 'package:hezma/utils/fonts.dart';
  import 'package:hezma/utils/routes.dart';

  import '../../../../../utils/constants.dart';

  class Custom_buttom_navigation_bar extends StatefulWidget {
    const Custom_buttom_navigation_bar({
      super.key,
    });

    @override
    State<Custom_buttom_navigation_bar> createState() => _Custom_buttom_navigation_barState();
  }

  class _Custom_buttom_navigation_barState extends State<Custom_buttom_navigation_bar> {
      int selectedIndex = 3;


      final List<Widget> screans = [
        const MyAccountScrean(),
        const MyCartScrean(),
        const FavoriteScrean(),
        const MainScrean1(),
      ];

      void onitemtap(int index){
        setState(() {
          selectedIndex = index;
        });
      }

    @override
    Widget build(BuildContext context) {
      return Scaffold(

  body: screans[selectedIndex],
  bottomNavigationBar: CurvedNavigationBar(
          backgroundColor:const  Color(backgroundcustomgreen2),
          index: 3,
          
          items: const  [
      CurvedNavigationBarItem(
        child: Icon(Icons.person , color:   Color(backgroundcustomgreen2),),
        label: 'حسابى',labelStyle: arabicstyle1,
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.shopping_cart, color:   Color(backgroundcustomgreen2),),
        label: 'السله',labelStyle: arabicstyle1,
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.favorite, color:   Color(backgroundcustomgreen2),),
        label: 'المفضله',labelStyle: arabicstyle1,
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.home, color:   Color(backgroundcustomgreen2),),
        label: 'الرئيسيه',labelStyle: arabicstyle1,
      ),
      
          ],
          onTap: onitemtap,
        ),
      );
    }
  }

