import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit/cart_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class CounterWidget2 extends StatefulWidget {
  final int initialCount;
  final Product product; // Add the product here

  const CounterWidget2({
    super.key,
    required this.initialCount,
    required this.product,
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

  void _updateCartQuantity() {
    final cartCubit = context.read<CartCubit>();
    cartCubit.updateProductQuantity(widget.product, count);
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
            _updateCartQuantity();
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
                _updateCartQuantity();
              }
            });
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
