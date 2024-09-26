import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hezma/Data/models/cart_models/cart_product/datum.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'counter_widget2.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
  });

  final CartProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(darkwhite),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            product.product!.name!,
                            style: arabicstyle2,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'ر.س/كجم',
                            style: arabicstyle2,
                          ),
                          Text(
                            product.totalPrice!,
                            style: arabicstyle3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CounterWidget2(
                          initialCount: int.parse(product.product!.amount!),
                          product: product.product!,
                          cartId: product.cartId!, // Pass the product here
                        ),
                        const Spacer(),
                        const Text(
                          'فواكه',
                          style: TextStyle(
                            fontFamily: karabicFont1,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 106, 106, 106),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(backgroundcolor1),
                ),
                child: Image.network(product.product!.image!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
