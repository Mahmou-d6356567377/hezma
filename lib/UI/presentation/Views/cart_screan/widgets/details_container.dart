import 'package:flutter/material.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
    required this.controller,
    required this.totalprice,
  });

  final TextEditingController controller;
  final int totalprice;
  @override
  Widget build(BuildContext context) {
    double tax = .15 * totalprice;
    double pricewithtax = tax + totalprice;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: const Color(darkwhite),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                  bottomLeft: Radius.circular(17),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              gradient: const LinearGradient(colors: [
                                Color(backgroundcustomgreen),
                                Color(backgroundcustomgreen2),
                              ])),
                          child: const Center(
                              child: Text(
                            'تطبيق',
                            style: arabicstyle2,
                          )),
                        ),
                      )),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: ' ادخل كوبون الخصم ',
                        hintStyle: TextStyle(
                          fontFamily: karabicFont1,
                        ),
                        hintTextDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        'ر.س',
                        style: arabicstyle3,
                      ),
                      Text(
                        totalprice.toString(),
                        style: arabicstyle3,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'قيمة المنتجات',
                    style: arabicstyle2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        'ر.س',
                        style: arabicstyle3,
                      ),
                      Text(
                        tax.toString(),
                        style: arabicstyle3,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'ضريبه القيمه المضافه %15',
                    style: arabicstyle2,
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        'ر.س',
                        style: arabicstyle3,
                      ),
                      Text(
                        pricewithtax.toString(),
                        style: arabicstyle3,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'المجموع',
                    style: arabicstyle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
