import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/models/cart_models/cart_product/product.dart';
import 'package:hezma/blocs/cart_cubits/cart_access_products_cubit/cart_access_cubit.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit/cart_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class CounterWidget2 extends StatefulWidget {
  final int initialCount;
  final Product1 product;
  final int cartId;

  const CounterWidget2({
    super.key,
    required this.initialCount,
    required this.product,
    required this.cartId,
  });

  @override
  State<CounterWidget2> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget2> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              count++;
            });
            print('count :: $count');
            context
                .read<CartAccessCubit>()
                .updateCartProductfun(cartId: widget.cartId, count: count);
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(backgroundcustomgreen2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            count.toString(),
            style: arabicstyle2,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (count > 1) {
                count--;
              }
            });
            print('count :: $count');
            context
                .read<CartAccessCubit>()
                .updateCartProductfun(cartId: widget.cartId, count: count);
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(backgroundcustomgreen2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
