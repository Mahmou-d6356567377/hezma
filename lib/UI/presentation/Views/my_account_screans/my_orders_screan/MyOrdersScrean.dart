import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/modfiy_account_screan/widgets/custom_couple_botton.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/widgets/MyOrdersList.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit/cart_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

class MyOrderScrean extends StatelessWidget {
  const MyOrderScrean({super.key});

  @override
  Widget build(BuildContext context) {
    double totalpricewithtax;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('طلباتى'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyordersList(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              decoration: customBoxDecoration.copyWith(border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartSuccess) {
                      totalpricewithtax = 1.15 * state.totalPrice;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'ر.س',
                            style: arabicstyle2,
                          ),
                          Text(
                            totalpricewithtax.toString(),
                            style: arabicstyle4,
                          ),
                          const Spacer(),
                          const Text(
                            'مجموع السعر بعد الضريبة',
                            style: arabicstyle2,
                          ),
                        ],
                      );
                    } else if (state is CartLoading) {
                      return const Center(
                        child: LinearProgressIndicator(),
                      );
                    } else {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'ر.س',
                            style: arabicstyle2,
                          ),
                          Text(
                            '0',
                            style: arabicstyle4,
                          ),
                          Spacer(),
                          Text(
                            'مجموع السعر بعد الضريبة',
                            style: arabicstyle2,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          CustomCoupleBotton(
            title1: 'تتبع',
            title2: 'الغاء الطلب',
            ontap1: () {
              GoRouter.of(context).push(AppRoutes.fs);
            },
            ontap2: () {
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
