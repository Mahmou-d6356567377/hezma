import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

class DialogHelper {
  static void showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          actionsPadding: const EdgeInsets.all(16.0),
          title: const Icon(Icons.login_outlined,
              color: Color(backgroundcustomgreen)),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('برجاء تسجيل الدخول', style: arabicstyle2),
            ],
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(backgroundcustomgreen),
                      textStyle: arabicstyle5,
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text('استكمال التصفح', style: arabicstyle5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(backgroundcustomgreen),
                      textStyle: arabicstyle5,
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.rs);
                    },
                    child: const Text('تسجيل الدخول', style: arabicstyle5),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
