import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class CounterWidget2 extends StatefulWidget {
  final int initialCount;

  const CounterWidget2({
    super.key,
    required this.initialCount,
  });

  @override
  State<CounterWidget2> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget2> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              count++;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(backgroundcustomgreen2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            count.toString(),
            style: arabicstyle2,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (count > 1) {
                count--;
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(backgroundcustomgreen2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
