import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/blocs/cart_cubits/make_order_cubit/make_order_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/my_orders_cubit/my_orders_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:intl/intl.dart';

class LastPayItem extends StatelessWidget {
  const LastPayItem({
    super.key,
    required this.totalPrice,
    required this.timeId,
    required this.date,
    this.addressdata,
    required this.mothodId,
    this.img,
     this.bankName, 
     this.userName, 
  });

  final int totalPrice;
  final int timeId;
  final DateTime date;
  final AddressData? addressdata;
  final int mothodId;
  final File? img;
  final String? bankName;
  final String? userName;

  @override
  Widget build(BuildContext context) {
    double totalPriceWithTax = 1.15 * totalPrice;
    String formattedDate = DateFormat('yyyy_M-dd').format(date);

    return BlocConsumer<MakeOrderCubit, MakeOrderState>(
      listener: (context, state) {
        if (state is MakeOrderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMsg)),
          );
            print(state.errMsg);
        } else if (state is MakeOrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.sucMsg)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
           const  SnackBar(content: LinearProgressIndicator()),
          );
        }
      },
      builder: (context, state) {
        return Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color(darkwhite),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(backgroundcustomgreen),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {

                    context.read<MakeOrderCubit>().makeOrderFunC(
                          paymethodId: mothodId,
                          addressId: addressdata!.id!,
                          timeId: timeId,
                          date: formattedDate,
                          shipping: '100',
                          img: img,
                          bankName:bankName ,
                          userName: userName, 
                        );
                  },
                  child: const Text(
                    'ادفع',
                    style: arabicstyle5,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'المجموع',
                    style: arabicstyle2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: Row(
                      children: [
                        const Text(
                          'ر.س',
                          style: arabicstyle3,
                        ),
                        Text(
                          totalPriceWithTax.toString(),
                          style: arabicstyle3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
