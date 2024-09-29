import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/custom_list_cart_item.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/details_container.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/last_item_cart.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/location_botton.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/switch_timing.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/text_row.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit/cart_cubit.dart';
import 'package:hezma/utils/fonts.dart';

class MyCartScrean extends StatefulWidget {
  const MyCartScrean({super.key});

  @override
  _MyCartScreanState createState() => _MyCartScreanState();
}

class _MyCartScreanState extends State<MyCartScrean> {
  final TextEditingController controller = TextEditingController();
  int? timeId; // Nullable to handle initial state
  DateTime? date; // Nullable to handle initial state
  AddressData? addressData; // Nullable to handle initial state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shopping_cart),
        centerTitle: true,
        title: const Text(
          'السله',
          style: arabicstyle2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartCubit>().fetchCartProducts();
            },
            icon: const Icon(Icons.sync),
          ),
        ],
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
                LocatoinBotton(
                  addressSelected: (selectedAddress) {
                    setState(() {
                      addressData = selectedAddress;
                    });
                  },
                ),
                const TextRow(title: 'وقت التوصيل المفضل'),
                DeliveryTimeWidget(
                  onDateSelected: (selectedDate, selectedTimeId) {
                    setState(() {
                      timeId = selectedTimeId;
                      date = selectedDate;
                    });
                  },
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartSuccess) {
                      return DetailsContainer(
                        key: const ValueKey('details_${1}'),
                        controller: controller,
                        totalprice: state.totalPrice.toInt(),
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
                          totalPrice: state.totalPrice.toInt(),
                          timeId: timeId ?? 0, // Fallback to default if null
                          addressdata: addressData, // Pass the selected address
                          date: date ??
                              DateTime
                                  .now(), // Fallback to current date if null
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LastItemCart(
                        key: const ValueKey('lastItem_${0}'),
                        totalPrice: 0,
                        timeId: timeId ?? 0, // Fallback to default if null
                        addressdata: addressData, // Pass the selected address
                        date: date ??
                            DateTime.now(), // Fallback to current date if null
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
