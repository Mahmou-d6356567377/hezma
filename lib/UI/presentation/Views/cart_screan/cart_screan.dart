import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/blocs/cart_cubit/cart_cubit.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/custom_list_cart_item.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/details_container.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/last_item_cart.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/location_botton.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/switch_timing.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/text_row.dart';
import 'package:hezma/utils/fonts.dart';

class MyCartScrean extends StatelessWidget {
  const MyCartScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'السله',
          style: arabicstyle2,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: CustomListItemCart(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const TextRow(title: 'حدد عنوان التوصيل'),
                const LocatoinBotton(),
                const TextRow(title: 'وقت التوصيل المفضل'),
                const SwitchTime(),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartSuccess) {
                      return DetailsContainer(
                        key: ValueKey(
                            'details_${state.totalPrice}'), // Unique key based on the total price
                        controller: controller,
                        totalprice: state.totalPrice,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                const TextRow(title: 'المجموع'),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartSuccess) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: LastItemCart(
                          key: ValueKey(
                              'lastItem_${state.totalPrice}'), // Unique key based on the total price
                          iscartscrean: true,
                          totalPrice: state.totalPrice,
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
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
