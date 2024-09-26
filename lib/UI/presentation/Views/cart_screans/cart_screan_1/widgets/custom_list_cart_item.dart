import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/cart_item.dart';
import 'package:hezma/blocs/cart_cubits/cart_access_products_cubit/cart_access_cubit.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit/cart_cubit.dart';

class CustomListItemCart extends StatelessWidget {
  const CustomListItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          if (state.cartProducts.isEmpty) {
            return const Center(
              child: Text('No products in the cart'),
            );
          }

          return Column(
            children: state.cartProducts.map((product) {
              if (product.product == null) {
                return const SizedBox.shrink();
              }

              // Use both `cartId` and `product id` to generate unique keys
              return Slidable(
                key: Key('${product.cartId}-${product.product!.id}'),
                startActionPane: ActionPane(
                  motion: const StretchMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () async {
                      // Perform the delete action
                      await context.read<CartAccessCubit>().deleteCartProduct(
                          cartId: product.cartId!,
                          id: product.product!.id!,
                          count: product.product!.amount!);

                      // After deletion, re-fetch the cart products
                      context.read<CartCubit>().fetchCartProducts();
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
        } else if (state is CartFailure) {
          return Center(
            child: Text(state.errorMSG),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
