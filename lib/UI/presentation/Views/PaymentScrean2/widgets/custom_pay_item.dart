import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';

class CustompayItem extends StatefulWidget {
  const CustompayItem({
    super.key, required this.ismada,
  });

final bool ismada ;
  @override
  State<CustompayItem> createState() => _CustompayItemState();
}

class _CustompayItemState extends State<CustompayItem> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration : customBoxDecoration,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.asset(widget.ismada?kmada:kvisa, )),
            ),
            Column(
              children: [
                const Text('mastercard'),
                const Text('*******343'),
                Checkbox(value: check, onChanged: (bool? value) {
            setState(() {
              check = !check;
            });
          },
          activeColor: Colors.blue,  // Color of the checkbox when checked
          checkColor: Colors.white, )
              ],
            ),
          ],
        )),
    );
  }
}