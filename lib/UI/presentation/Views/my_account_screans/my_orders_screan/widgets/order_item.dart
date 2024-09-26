import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_card_details/datum.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_product_model/data.dart';
import 'package:hezma/blocs/my_account_cubits/cancel_order_cubit/cancelorder_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/my_orders_cubit/my_orders_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.productDetails,
  });
  final OrderData productDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[400]!,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${productDetails.orderId}#',
                style: arabicstyle2,
              ),
              const Spacer(),
              const Text(
                'رقم الطلب',
                style: arabicstyle1,
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'ريال',
                style: arabicstyle2,
              ),
              Text(
                '${productDetails.totalPrice}',
                style: arabicstyle2,
              ),
              const Spacer(),
              const Text(
                'السعر',
                style: arabicstyle1,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                productDetails.date != null ? '${productDetails.date}' : 'N/A',
                style: arabicstyle2,
              ),
              const Spacer(),
              const Text(
                'التاريخ',
                style: arabicstyle1,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 14),
                  child: BlocListener<CancelorderCubit, CancelorderState>(
                    listener: (context, state) {
                      if (state is CancelorderSuccess) {
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.succMsg)));
                      }else if (state is CancelorderFailure) {
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMsg)));
                      }else {
                        const CircularProgressIndicator();
                      }
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(backgroundcustomgreen),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () async{
                        await context.read<CancelorderCubit>().cancelOrderFun(id: productDetails.orderId!);
                        await context.read<MyOrdersCubit>().fetchMyOrders();
                      },
                      child: const Text(
                        'الغاء الطلب',
                        style: arabicstyle5,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0, top: 14),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(backgroundcustomgreen),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      GoRouter.of(context)
                          .push(AppRoutes.fs, extra: productDetails.orderId);
                    },
                    child: const Text(
                      'متابعة الطلب',
                      style: arabicstyle5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
