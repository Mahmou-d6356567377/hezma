import 'package:flutter/material.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/utils/fonts.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.productdetails,
  });

  final Product productdetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'ر.س/كجم',
          style: arabicstyle2.copyWith(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            productdetails.price!,
            style: arabicstyle3.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
