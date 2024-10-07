import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/payment_screan/widgets/last_pay_item.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/payment_screan/widgets/switch_pay_containers.dart';
import 'package:hezma/blocs/cart_cubits/pay_method_cubit/pay_mothod_cubit.dart';
import 'package:hezma/utils/fonts.dart';
import 'widgets/pay_way_botton.dart';

class PaymentScrean extends StatefulWidget {
  const PaymentScrean({
    Key? key,
    required this.timeId,
    required this.date,
    required this.addressdata,
    required this.totalPrice,
  }) : super(key: key);

  final int timeId;
  final DateTime date;
  final AddressData? addressdata;
  final int totalPrice;

  @override
  State<PaymentScrean> createState() => _PaymentScreanState();
}

class _PaymentScreanState extends State<PaymentScrean> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();

  int? selectedPayMethodId;
  File? _image;  // Image file to pass to LastPayItem

  @override
  void initState() {
    super.initState();
    selectedPayMethodId = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('طريقة الدفع', style: arabicstyle2),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<PayMothodCubit, PayMothodState>(
              builder: (context, state) {
                if (state is PayMothodSuccess) {
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.payMethods.length,
                      itemBuilder: (context, index) {
                        final method = state.payMethods[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPayMethodId = method.id;
                            });
                          },
                          child: PayWayBotton(
                            title: method.name!,
                            img: method.image,
                            id: method.id!,
                            desc: method.desc!,
                            isSelected: selectedPayMethodId == method.id,
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is PayMothodFailure) {
                  return Text(state.errMsg);
                } else {
                  return const LinearProgressIndicator();
                }
              },
            ),
          ),
          Expanded(
            child: SwitchPayContainers(
              iscontainer1: selectedPayMethodId == 1,
              iscontainer2: selectedPayMethodId == 2,
              iscontainer3: selectedPayMethodId == 3,
              iscontainer4: selectedPayMethodId == 4,
              firstController: firstController,
              secondController: secondController,
              thirdController: thirdController,
              forthController: fourthController,
              onImageSelected: (File? value) {
                setState(() {
                  _image = value;
                });
                print('Selected image: $_image');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LastPayItem(
              totalPrice: widget.totalPrice,
              timeId: widget.timeId,
              date: widget.date,
              addressdata: widget.addressdata,
              mothodId: selectedPayMethodId!,
              img: _image, 
              bankName: firstController.text,
              userName: thirdController.text,
            ),
          ),
        ],
      ),
    );
  }
}
