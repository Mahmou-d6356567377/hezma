import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/widgets/MyOrdersList.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/widgets/canceled_order_list.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/widgets/prev_orders_list.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class MyOrderScrean extends StatefulWidget {
  const MyOrderScrean({super.key});

  @override
  State<MyOrderScrean> createState() => _MyOrderScreanState();
}

class _MyOrderScreanState extends State<MyOrderScrean> {
  // Declare the boolean variables as class-level state variables
  bool b1 = false;
  bool b2 = false;
  bool b3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('طلباتى'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          b1 ? const Color(backgroundcustomgreen) : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        // Update button states when pressed
                        b1 = true;
                        b2 = false;
                        b3 = false;
                      });
                    },
                    child:  Text('الطلبات الملغيه',
                   style:  b1 ? arabicstyle5: arabicstyle4,
),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          b2 ? const Color(backgroundcustomgreen) : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        // Update button states when pressed
                        b1 = false;
                        b2 = true;
                        b3 = false;
                      });
                    },
                    child:  Text('الطلبات السابقة',
                    style:  b2 ? arabicstyle5: arabicstyle4,
),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          b3 ? const Color(backgroundcustomgreen) : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        // Update button states when pressed
                        b1 = false;
                        b2 = false;
                        b3 = true;
                      });
                    },
                    child:  Text('الطلبات الحاليه',
                     style:  b3 ? arabicstyle5: arabicstyle4,
                     ),
                  ),
                ),
              ],
            ),
          ),
         b3 ?  const MyordersList() : b1? const CanceledordersList() : const PrevordersList(),
        ],
      ),
    );
  }
}
