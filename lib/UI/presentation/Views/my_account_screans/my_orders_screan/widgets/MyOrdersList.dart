import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/widgets/order_item.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit.dart';

class MyordersList extends StatelessWidget {
  const MyordersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        } else if (state is CartSuccess) {
          return Column(
            children: state.cartProduct.map((product) {
              return Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: OrderItem(productDetails: product));
            }).toList(),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
