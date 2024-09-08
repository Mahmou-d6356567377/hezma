import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/blocs/my_account_cubits/wallet_cubit/wallet_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class PaymentScrean2 extends StatelessWidget {
  const PaymentScrean2({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController payController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'المحفظه',
          style: arabicstyle2,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 120, 172, 46),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'رصيد المحفظه',
                      style: arabicstyle5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ريال',
                          style: arabicstyle5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: state is WalletSuccess
                              ? Text(
                                  state.data,
                                  style: arabicstyle5,
                                )
                              : state is WalletLoading
                                  ? const CircularProgressIndicator()
                                  : const Text('!'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.read<WalletCubit>().chargeWalletData(
                                amount: int.parse(payController.toString()),
                                paymentMethodId: 2);
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 120, 172, 46),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: Text(
                              'الشحن',
                              style: TextStyle(
                                  fontFamily: karabicFont2,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            controller: payController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[400],
                              disabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              hintTextDirection: TextDirection.rtl,
                              hintText: 'قيمة الشحن',
                              hintStyle: const TextStyle(
                                fontFamily: karabicFont1,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'المعاملات',
                      style: arabicstyle2,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
