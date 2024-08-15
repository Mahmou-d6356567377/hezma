import 'package:flutter/material.dart';
import 'package:hezma/Data/models/home_products_model/product.dart';
import 'package:hezma/utils/fonts.dart';

class ProductDesc extends StatelessWidget {
  const ProductDesc({
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
          productdetails.desc!
          ,
          style: arabicstyle2.copyWith(fontSize: 13),
          maxLines: 2,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

