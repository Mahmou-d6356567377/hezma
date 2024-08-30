import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _StepperState();
}

class _StepperState extends State<CustomStepper> {
  int activeStep = 3;
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
        activeStep: 4,
        lineStyle: const LineStyle(
          lineType: LineType.normal,
          lineThickness: 3,
          progress: .9,
          lineLength: 44,
          activeLineColor: Color(backgroundcustomgreen2),
          defaultLineColor: Color(backgroundcustomgreen2),
        ),
        activeStepTextColor: Colors.black,
        finishedStepTextColor: Colors.black,
        internalPadding: 0,
        showLoadingAnimation: false,
        stepRadius: 22,
        showStepBorder: false,
        steps: [
          EasyStep(
            title: 'تسليم الطلب',
            customStep: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(backgroundcustomgreen2),
              child: (activeStep == 0)
                  ? Image.asset(
                      kvector,
                      width: 40,
                    )
                  : Image.asset(
                      kgreenwhitecircle,
                      width: 40,
                    ),
            ),
          ),
          EasyStep(
            title: 'توصيل الطلب',
            customStep: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(backgroundcustomgreen2),
              child: (activeStep == 1)
                  ? Image.asset(
                      kvector,
                      width: 40,
                    )
                  : Image.asset(
                      kgreenwhitecircle,
                      width: 40,
                    ),
            ),
          ),
          EasyStep(
            title: 'تجهيز الطلب',
            customStep: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(backgroundcustomgreen2),
              child: (activeStep == 2)
                  ? Image.asset(
                      kvector,
                      width: 40,
                    )
                  : Image.asset(
                      kgreenwhitecircle,
                      width: 40,
                    ),
            ),
          ),
          EasyStep(
            title: 'استلام الطلب',
            customStep: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(backgroundcustomgreen2),
              child: (activeStep == 3)
                  ? Image.asset(
                      kvector,
                      width: 40,
                    )
                  : Image.asset(
                      kgreenwhitecircle,
                      width: 40,
                    ),
            ),
          ),
        ],
        onStepReached: (index) {
          setState(() => activeStep = index);
        });
  }
}
