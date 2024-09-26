import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Item_screan/widgets/total_price_widget.dart';
import 'package:hezma/blocs/cart_cubits/cart_access_products_cubit/cart_access_cubit.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit/cart_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class PriceDetailsContainer extends StatelessWidget {
  const PriceDetailsContainer({
    super.key,
    required this.totalprice,
    required this.productModel,
  });

  final int totalprice;
  final Product productModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          height: 65,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1), // Shadow color
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            color: const Color(backgroundcolor1),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    try {
                      context.read<CartAccessCubit>().addProductToCart(
                          productId: productModel.id!,
                          count: productModel.amount!,
                          price: productModel.price!);
                      context.read<CartCubit>().fetchCartProducts();
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          actions: <Widget>[
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 20),
                                child: Image.asset(kcarticon),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'تمت اضافة المنتج الى السله',
                                    style: arabicstyle2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                          surfaceTintColor: const Color(backgroundcolor1),
                          shadowColor: Colors.black26,
                        ),
                      );
                    } catch (e) {
                      print('Error to add product to the cart $e');
                    }
                  },
                  child: Stack(
                    children: [
                      Image.asset(krecaddcart),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 15),
                        child: Image.asset(kaddcart),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              TotalPriceWidget(totalprice: totalprice),
            ],
          ),
        );
      },
    );
  }
}
