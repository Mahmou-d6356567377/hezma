import 'package:flutter/material.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/utils/fonts.dart';

class ProductNameWidget extends StatelessWidget {
  const ProductNameWidget({
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
          productdetails.name!,
          style: arabicstyle2.copyWith(fontSize: 25),
        ),
      ],
    );
  }
}
