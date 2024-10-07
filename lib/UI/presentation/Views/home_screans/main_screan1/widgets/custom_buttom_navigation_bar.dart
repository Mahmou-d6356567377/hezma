import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Needed for SystemNavigator.pop()
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/cart_screan.dart';
import 'package:hezma/UI/presentation/Views/favorite_screan/favorite_screan.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/main_screan1.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_account_screan/my_account_screan.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class Custom_buttom_navigation_bar extends StatefulWidget {
  const Custom_buttom_navigation_bar({super.key});

  @override
  State<Custom_buttom_navigation_bar> createState() =>
      Custom_buttom_navigation_barState();
}

class Custom_buttom_navigation_barState
    extends State<Custom_buttom_navigation_bar> {
  int selectedIndex = 3; // Default screen index

  final List<Widget> screans = [
    const MyAccountScrean(),
    const MyCartScrean(),
    const FavoriteScrean(),
    const MainScrean1(),
  ];

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => SizedBox(
            width: MediaQuery.of(context).size.width*.9,
            child: AlertDialog(
              title: const Text('مغادره'),
              content: const Text('هل تريد مغادره التطبيق'),
              actions: <Widget>[
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                         onPressed: () {
                           SystemNavigator.pop(); 
                         },
                         style: ElevatedButton.styleFrom(
                           backgroundColor: const Color.fromARGB(255, 232, 24, 9), // Red color
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8), // Reduce radius
                           ),
                         ),
                         child: const Text('نعم', style: arabicstyle5,),
                       ),
                       const SizedBox(width: 5,),
                       ElevatedButton(
                         onPressed: () => Navigator.of(context).pop(false), // Close dialog
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.grey[400],
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8), 
                           ),
                         ),
                         child: const Text('لا' , style: arabicstyle2,),
                       ),
            
                ],
               )
              ],
            ),
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, 
      child: Scaffold(
        body: screans[selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(17),
            topStart: Radius.circular(17),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            onTap: onItemTap, // Simply switch screens on tap, no dialog
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
      ),
    );
  }
}
