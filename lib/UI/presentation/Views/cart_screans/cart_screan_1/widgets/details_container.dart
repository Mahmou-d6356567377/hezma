import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/blocs/cart_cubits/varify_coupon_cubit/varify_coupon_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

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
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 150,
        decoration: BoxDecoration(
          color: const Color(darkwhite),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              height: 40,
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
                        child:
                            BlocConsumer<VarifyCouponCubit, VarifyCouponState>(
                          listener: (context, state) {
                            if (state is VarifyCouponSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.succmsg)));
                              print(state.succmsg);
                            } else if (state is VarifyCouponFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.errMsg)));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: LinearProgressIndicator()));
                            }
                          },
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<VarifyCouponCubit>()
                                    .varifyCouponCubitFun(
                                        coupon: controller.text);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    gradient: const LinearGradient(colors: [
                                      Color(backgroundcustomgreen),
                                      Color.fromARGB(255, 9, 247, 120),
                                    ])),
                                child: const Center(
                                    child: Text(
                                  'تطبيق',
                                  style: arabicstyle2,
                                )),
                              ),
                            );
                          },
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
                        style: arabicstyle2,
                      ),
                      Text(
                        totalprice.toString(),
                        style: arabicstyle2,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'قيمة المنتجات',
                    style: arabicstyle1,
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
                        style: arabicstyle2,
                      ),
                      Text(
                        tax.toString(),
                        style: arabicstyle2,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'ضريبه القيمه المضافه %15',
                    style: arabicstyle1,
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
                        style: arabicstyle2,
                      ),
                      Text(
                        pricewithtax.toString(),
                        style: arabicstyle2,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'المجموع',
                    style: arabicstyle1,
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
