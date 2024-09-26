import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/widgets/order_item.dart';
import 'package:hezma/blocs/my_account_cubits/my_canceld_orders_cubit/mycanceled_order_cubit.dart';

class CanceledordersList extends StatelessWidget {
  const CanceledordersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MycanceledOrderCubit, MycanceledOrderState>(
      builder: (context, state) {
        if (state is MycanceledOrderFailure) {
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
        } else if (state is MycanceledOrderSuccess) {
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
