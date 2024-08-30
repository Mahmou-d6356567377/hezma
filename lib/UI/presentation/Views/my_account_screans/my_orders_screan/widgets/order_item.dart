import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/widgets/location_widget.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.productDetails,
  });
  final Product productDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        decoration: customBoxDecoration,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          productDetails.name!,
                          style: arabicstyle2,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'فواكه',
                          style: arabicstyle3,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const LocationWidgetOrder(),
                        const Spacer(),
                        Row(
                          children: [
                            const Text(
                              'ر.س/كجم',
                              style: arabicstyle2,
                            ),
                            Text(
                              productDetails.price!,
                              style: arabicstyle3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(backgroundcolor1),
                  ),
                  child: Image.network(productDetails.image!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
