import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/main_screan1/widgets/listItem.dart';
import 'package:hezma/utils/fonts.dart';

class ShowPriceWidget extends StatelessWidget {
  const ShowPriceWidget({
    super.key,
    required this.widget,
  });

  final ListItem widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'ر.س/كجم',
          style: arabicstyle2.copyWith(fontSize: 11),
        ),
        Text(
          widget.productModel.price!,
          style: arabicstyle3.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
