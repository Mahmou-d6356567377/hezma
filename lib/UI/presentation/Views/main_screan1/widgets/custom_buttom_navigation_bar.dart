  import 'package:flutter/material.dart';
  import 'package:hezma/UI/presentation/Views/cart_screan/cart_screan.dart';
  import 'package:hezma/UI/presentation/Views/favorite_screan/favorite_screan.dart';
  import 'package:hezma/UI/presentation/Views/main_screan1/main_screan1.dart';
  import 'package:hezma/UI/presentation/Views/my_account_screan/my_account_screan.dart';
import 'package:hezma/utils/constants.dart';



 class Custom_buttom_navigation_bar extends StatefulWidget {
  const Custom_buttom_navigation_bar({super.key});

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

  void onitemtap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screans[selectedIndex],
      
      bottomNavigationBar: ClipRRect(
        borderRadius: const  BorderRadiusDirectional.only(
          topEnd: Radius.circular(17),
           topStart: Radius.circular(17)),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          onTap: onitemtap,
           iconSize: 25,
          selectedFontSize: 14,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(backgroundcustomgreen),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'حسابى',
              backgroundColor: Color(backgroundcustomgreen2),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              backgroundColor: Color(backgroundcustomgreen2),
              label: 'السله',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
            backgroundColor: Color(backgroundcustomgreen2),
              label: 'المفضله',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            backgroundColor: Color(backgroundcustomgreen2),
              label: 'الرئيسيه',
            ),
          ],
          currentIndex: selectedIndex,
        
            showUnselectedLabels: true,
            showSelectedLabels: true,
        ),
      ),
    );
  }
}
