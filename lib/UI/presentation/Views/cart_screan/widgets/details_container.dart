import 'package:flutter/material.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/fonts.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
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
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'ر.س',
                        style: arabicstyle3,
                      ),
                      Text(
                        ' 20.00',
                        style: arabicstyle3,
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    'قيمة المنتجات',
                    style: arabicstyle2,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'ر.س',
                        style: arabicstyle3,
                      ),
                      Text(
                        ' 20.00',
                        style: arabicstyle3,
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    'ضريبه القيمه المضافه %15',
                    style: arabicstyle2,
                  ),
                ],
              ),
            ),
            const Divider(),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'ر.س',
                        style: arabicstyle3,
                      ),
                      Text(
                        ' 20.00',
                        style: arabicstyle3,
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
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
