import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/cart_item.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit.dart';


class CustomListItemCart extends StatelessWidget {
  const CustomListItemCart({
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
              return Slidable(
                key: Key(product.id.toString()),
                startActionPane: ActionPane(
                  motion: const StretchMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () {
                      context.read<CartCubit>().removeProductFromCart(product);
                    },
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      icon: Icons.delete,
                      label: 'حذف',
                    ),
                  ],
                ),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: CartItem(
                    product: product,
                  ),
                ),
              );
            }).toList(),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
