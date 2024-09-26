import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/widgets/order_item.dart';
import 'package:hezma/blocs/my_account_cubits/prev_orders_list_cubit/prev_orders_list_cubit.dart';

class PrevordersList extends StatelessWidget {
  const PrevordersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrevOrdersListCubit, PrevOrdersListState>(
      builder: (context, state) {
        if (state is PrevOrdersListFailure) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.red.shade100,
                  ),
                ),
              );
            },
          );
        } else if (state is PrevOrdersListSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.myCanceledOrders.length,
            itemBuilder: (context, index) {
              final product = state.myCanceledOrders[index];
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: OrderItem(productDetails: product),
              );
            },
          );
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.grey.shade100,
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
