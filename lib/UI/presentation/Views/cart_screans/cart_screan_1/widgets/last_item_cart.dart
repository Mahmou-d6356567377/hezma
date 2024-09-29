import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/models/cart_models/pay_models/pay_model1.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';
import 'package:intl/intl.dart';

class LastItemCart extends StatelessWidget {
  const LastItemCart({
    super.key,
    required this.totalPrice,
    required this.timeId,
    required this.date,
    this.addressdata,
  });

  final int totalPrice;
  final int timeId;
  final DateTime date;
  final AddressData? addressdata;

  @override
  Widget build(BuildContext context) {
    double totalPriceWithTax = 1.15 * totalPrice;

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
                  side: const BorderSide(color: Colors.transparent),
                ),
              ),
              onPressed: () {
                if (addressdata == null ||
                    totalPrice == 0 ||
                    date == DateTime.now() ||
                    timeId == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('يجب ان تملا جميع الحقول')));
                } else {
                  // Create an instance of PaymentData
                  final paymentData = PaymentData1(
                    totalPrice: totalPrice,
                    timeId: timeId,
                    date: date,
                    addressdata: addressdata,
                  );

                  // Pass paymentData through the extra parameter
                  GoRouter.of(context).push(
                    AppRoutes.pms,
                    extra: paymentData,
                  );
                }
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
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
  }
}
