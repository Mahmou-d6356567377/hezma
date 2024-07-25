import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/payment_screan/widgets/switch_pay_containers.dart';
import 'package:hezma/utils/constants.dart';
import '../../../../utils/fonts.dart';
import '../cart_screan/widgets/last_item_cart.dart';
import 'widgets/pay_way_botton.dart';

class PaymentScrean extends StatefulWidget {
  const PaymentScrean({Key? key}) : super(key: key);

  @override
  State<PaymentScrean> createState() => _PaymentScreanState();
}

class _PaymentScreanState extends State<PaymentScrean> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  bool? isClick1;
  bool? isClick2;
  bool? isClick3;
  bool? isClick4;

  @override
  void initState() {
    super.initState();
    isClick1 = true;
    isClick2 = false;
    isClick3 = false;
    isClick4 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('طريقه الدفع', style: arabicstyle2),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isClick1 = false;
                        isClick2 = false;
                        isClick3 = false;
                        isClick4 = true;
                      });
                    },
                    child: PayWayBotton(
                      title: 'بوابات تقسيط',
                      img: kpay4Logo,
                      isclick: isClick4!,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isClick1 = false;
                        isClick2 = false;
                        isClick3 = true;
                        isClick4 = false;
                      });
                    },
                    child: PayWayBotton(
                      title: 'تحويل بنكى',
                      img: kpay3Logo,
                      isclick: isClick3!,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isClick1 = false;
                        isClick2 = true;
                        isClick3 = false;
                        isClick4 = false;
                      });
                    },
                    child: PayWayBotton(
                      title: 'دفع الكترونى',
                      img: kpay2Logo,
                      isclick: isClick2!,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isClick1 = true;
                        isClick2 = false;
                        isClick3 = false;
                        isClick4 = false;
                      });
                    },
                    child: PayWayBotton(
                      title: 'دفع عند الاستلام',
                      img: kpay1Logo,
                      isclick: isClick1!,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SwitchPayContainers(
              iscontainer1: isClick1!,
               iscontainer2: isClick2!, 
               iscontainer3: isClick3!,
                iscontainer4: isClick4!, 
                firstController: firstController,
                secondController: secondController,
                thirdController: thirdController,
                forthController: fourthController,),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: LastItemCart(
              iscartscrean: false,
            ),
          ),
        ],
      ),
    );
  }
}