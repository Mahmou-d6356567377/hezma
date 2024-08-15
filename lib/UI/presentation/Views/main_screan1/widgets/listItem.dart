import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/models/home_products_model/product.dart';
import 'package:hezma/UI/presentation/Views/main_screan1/widgets/show_price_widget.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';
import '../../../../../utils/constants.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key, required this.productModel,
  });
  

   final Product productModel;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  double rating = 0.5;
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kIIs , extra: {
    'product': widget.productModel,
    'rating': rating,
  },);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xffF0F0F0),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 1,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(backgroundcustomgreen),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(17)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Color(
                      backgroundcolor1,
                    ),
                    size: 25,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(backgroundcolor1),
                        ),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.network(widget.productModel.image!)),
                            Positioned(
                              top: -5,
                              left: -5,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: isfavorite
                                        ? const Color.fromARGB(
                                            255, 189, 237, 121)
                                        : const Color(backgroundcustomgreen),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isfavorite = !isfavorite;
                                      });
                                    },
                                    icon: Icon(Icons.favorite,
                                        color: isfavorite
                                            ? const Color(
                                                backgroundcustomgreen2)
                                            : const Color(backgroundcolor1)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                             widget.productModel.name!,
                              style: arabicstyle2,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PannableRatingBar(
                              textDirection: TextDirection.rtl,
                              rate: rating,
                              items: List.generate(
                                  5,
                                  (index) => const RatingWidget(
                                        selectedColor: Colors.green,
                                        unSelectedColor:
                                            Color(backgroundcolor1),
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                        ),
                                      )),
                              onChanged: (value) {
                                setState(() {
                                  rating = value;
                                });
                              },
                            ),
                          ],
                        ),
                        ShowPriceWidget(widget: widget),
                      ],
                    )),

                //
              ],
            ),
          ],
        ),
      ),
    );
  }
}

