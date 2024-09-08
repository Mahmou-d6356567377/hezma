import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/follow_screan/widgets/stepper.dart';
import 'package:hezma/blocs/my_account_cubits/order_details_cubit/order_details_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class FollowDetailsContainer extends StatefulWidget {
  const FollowDetailsContainer({super.key,required this.id1});
   final int id1;
  @override
  State<FollowDetailsContainer> createState() => _FollowDetailsContainerState();
}

class _FollowDetailsContainerState extends State<FollowDetailsContainer> {
  @override
  void initState() {
    super.initState();

    context.read<OrderDetailsCubit>().fetchOrderDatails(id: widget.id1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          if (state is OrderDetailsISuccess) {
            return Container(
              decoration: customBoxDecoration,
              child: Column(
                children: [
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          state.orderData.orderId.toString(),
                          style: arabicstyle4,
                        ),
                       const  Text(
                          'تتبع توصيل طلبك رقم',
                          style: arabicstyle2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                             const  Text(
                                'حالة الطلب',
                                style: arabicstyle4,
                              ),
                              Text(
                                state.orderData.statusName!,
                                style: arabicstyle2,
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            children: [
                              Text(
                                'عدد الاصناف',
                                style: arabicstyle4,
                              ),
                              Text(
                                'اصناف3',
                                style: arabicstyle2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                            const   Text(
                                'تاريخ الطلب',
                                style: arabicstyle4,
                              ),
                              Text(
                                state.orderData.orderDate.toString(),
                                style: arabicstyle2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                    padding:
                       const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          state.orderData.orderDeliveryTime ?? 'unknown',
                          style: arabicstyle6,
                        ),
                       
                        const Text(
                          'بين الوقت',
                          style: arabicstyle2,
                        ),
                        Text(
                          state.orderData.orderDeliveryData ?? 'unknown',
                          style: arabicstyle6,
                        ),
                        const Text(
                          'الوقت المتوقع الوصول فيه',
                          style: arabicstyle2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      color: Colors.transparent,
                      height: 75,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomStepper(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is OrderDetailsFailure) {
            return Text(state.errMsg);
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
