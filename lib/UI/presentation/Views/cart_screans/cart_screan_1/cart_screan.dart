import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/custom_list_cart_item.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/details_container.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/last_item_cart.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/location_botton.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/switch_timing.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/text_row.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit/cart_cubit.dart';
import 'package:hezma/utils/fonts.dart';

class MyCartScrean extends StatelessWidget {
  const MyCartScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shopping_cart),
        centerTitle: true,
        title: const Text(
          'السله',
          style: arabicstyle2,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: CustomListItemCart(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const TextRow(title: 'حدد عنوان التوصيل'),
                const LocatoinBotton(),
                const TextRow(title: 'وقت التوصيل المفضل'),
                DeliveryTimeWidget(onDateSelected: (DateTime t, int) {}),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartSuccess) {
                      return DetailsContainer(
                        key: const ValueKey('details_${1}'),
                        controller: controller,
                        totalprice:
                            state.totalPrice.toInt(), // Pass total price here
                      );
                    }
                    return DetailsContainer(
                      key: const ValueKey('details_${0}'),
                      controller: controller,
                      totalprice: 0,
                    );
                  },
                ),
                const TextRow(title: 'المجموع'),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartSuccess) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: LastItemCart(
                          key: const ValueKey('lastItem_${1}'),
                          iscartscrean: true,
                          totalPrice:
                              state.totalPrice.toInt(), // Pass total price here
                        ),
                      );
                    }
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: LastItemCart(
                        key: ValueKey('lastItem_${0}'),
                        iscartscrean: true,
                        totalPrice: 0,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
