import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/counter_widget2.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Item_screan/widgets/customGridView3.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Item_screan/widgets/price_details_container.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Item_screan/widgets/product_desc.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Item_screan/widgets/product_name_widget.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Item_screan/widgets/product_price.dart';
import 'package:hezma/utils/fonts.dart';

class ItemScrean extends StatefulWidget {
  const ItemScrean({
    super.key,
    required this.productdetails,
    required this.rating,
  });

  final Product productdetails;
  final double rating;

  @override
  State<ItemScrean> createState() => _ItemScreanState();
}

class _ItemScreanState extends State<ItemScrean> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    int price = int.parse(widget.productdetails.price!);
    int totalprice = price * count;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                widget.productdetails.image!,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                        ProductNameWidget(
                            productdetails: widget.productdetails),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CounterWidget2(
                              initialCount: count,
                              product: widget
                                  .productdetails, // Pass the correct product reference
                            ),
                            const Spacer(),
                            PannableRatingBar(
                              textDirection: TextDirection.rtl,
                              rate: widget.rating,
                              items: List.generate(
                                5,
                                (index) => RatingWidget(
                                  unSelectedColor: Colors.grey[300],
                                  selectedColor: Colors.green,
                                  child: const Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ProductPrice(productdetails: widget.productdetails),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, bottom: 20, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'مزيد من التفاصيل',
                                    style: arabicstyle3.copyWith(fontSize: 15),
                                  ),
                                ],
                              ),
                              ProductDesc(
                                  productdetails: widget.productdetails),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'مزيد من المنتجات',
                              style: arabicstyle3.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: CustomGridView3(),
                  ),
                ],
              ),
            ),
            PriceDetailsContainer(
              totalprice: totalprice,
              productModel: widget.productdetails,
            ),
          ],
        ),
      ),
    );
  }
}
