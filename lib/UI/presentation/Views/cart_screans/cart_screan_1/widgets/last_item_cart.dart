import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/switch_botton.dart';
import 'package:hezma/utils/routes.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class LastItemCart extends StatelessWidget {
  const LastItemCart({
    super.key,
    required this.iscartscrean,
    required this.totalPrice,
  });
  final int totalPrice;
  final bool iscartscrean;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(darkwhite),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              iscartscrean
                  ? GoRouter.of(context).push(AppRoutes.pms)
                  : showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        actions: <Widget>[
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 20),
                            child: Image.asset(kcheckpaylogo),
                          )),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'تم الدفع بنجاح',
                                  style: arabicstyle3,
                                ),
                              ],
                            ),
                          ),
                        ],
                        surfaceTintColor: const Color(backgroundcolor1),
                        shadowColor: Colors.black26,
                      ),
                    );
            },
            child: const SizedBox(
                width: 120,
                child: SwitchBotton(checkevening: false, title: 'ادفع')),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'المجموع',
                style: arabicstyle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Row(
                  children: [
                    const Text(
                      'ر.س',
                      style: arabicstyle3,
                    ),
                    Text(
                      totalPrice.toString(),
                      style: arabicstyle3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
