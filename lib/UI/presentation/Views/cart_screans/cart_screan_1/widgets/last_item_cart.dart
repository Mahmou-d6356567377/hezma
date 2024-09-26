import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

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
    double tatalPricewithtax = 1.15 * totalPrice;
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
            child: SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(backgroundcustomgreen),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.pms);
                },
                child: const Text(
                  'ادفع',
                  style: arabicstyle5,
                ),
              ),
            ),
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
                      tatalPricewithtax.toString(),
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
