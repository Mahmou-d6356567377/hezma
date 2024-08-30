import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/follow_screan/widgets/stepper.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class FollowDetailsContainer extends StatelessWidget {
  const FollowDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Container(
        decoration: customBoxDecoration,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '(43454)',
                    style: arabicstyle4,
                  ),
                  Text(
                    'تتبع توصيل طلبك رقم',
                    style: arabicstyle2,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'حالة الطلب',
                          style: arabicstyle4,
                        ),
                        Text(
                          'قيد التنفيذ',
                          style: arabicstyle2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'عدد الاصناف',
                          style: arabicstyle4,
                        ),
                        Text(
                          'اصناف3',
                          style: arabicstyle2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'تاريخ الطلب',
                          style: arabicstyle4,
                        ),
                        Text(
                          '20/07/2024',
                          style: arabicstyle2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ' 5:00 ',
                    style: arabicstyle6,
                  ),
                  Text(
                    'الى',
                    style: arabicstyle2,
                  ),
                  Text(
                    ' 4:30 ',
                    style: arabicstyle6,
                  ),
                  Text(
                    'بين الوقت',
                    style: arabicstyle2,
                  ),
                  Text(
                    ' 30/7/2024 ',
                    style: arabicstyle6,
                  ),
                  Text(
                    'الوقت المتوقع الوصول فيه',
                    style: arabicstyle2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                color: Colors.transparent,
                height: 75,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomStepper(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
