import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';
import 'package:timer_button/timer_button.dart';

class Timer_button extends StatelessWidget {
  const Timer_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white, 
          
          border: Border.all(color: const Color(backgroundcustomgreen2),), 
        ),
        child: Center(
          child: TimerButton.builder(
            builder: (context, timeLeft) {
              return Text(
                "اعاده ارسال كود التفعيل خلال $timeLeft",
                style: const TextStyle(color: Colors.red),
              );
            },
            onPressed: () {
              log("Time for some action!");
            },
            timeOutInSeconds: 30,
          ),
        ),
      ),
    );
  }
}
