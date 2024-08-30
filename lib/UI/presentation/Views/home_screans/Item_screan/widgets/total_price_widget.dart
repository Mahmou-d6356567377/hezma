import 'package:flutter/material.dart';
import 'package:hezma/utils/fonts.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({
    super.key,
    required this.totalprice,
  });

  final int totalprice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'مجموع السعر',
            style: arabicstyle2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'ر.س/كجم',
                style: arabicstyle2.copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  totalprice.toString(),
                  style: arabicstyle3.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
