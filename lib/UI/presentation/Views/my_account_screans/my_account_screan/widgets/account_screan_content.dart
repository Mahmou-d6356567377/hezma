import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_account_screan/widgets/my_account_item.dart';
import 'package:hezma/blocs/auth_cubits/log_out_cubit/cubit/log_out_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreanContent extends StatelessWidget {
  const AccountScreanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              klogo,
              height: 200,
            ),
            MyAccountItem(
                title: 'تعديل الحساب',
                icon: const Icon(
                  Icons.person,
                  color: Color(backgroundcustomgreen),
                ),
                ontap: () {
                  GoRouter.of(context).push(AppRoutes.mas);
                }),
            MyAccountItem(
                title: 'طلباتى',
                icon: const Icon(
                  Icons.file_present,
                  color: Color(backgroundcustomgreen),
                ),
                ontap: () {
                  GoRouter.of(context).push(AppRoutes.mos);
                }),
            MyAccountItem(
                title: 'العناوين',
                icon: const Icon(
                  Icons.location_on,
                  color: Color(backgroundcustomgreen),
                ),
                ontap: () {
                  GoRouter.of(context).push(AppRoutes.ads);
                }),
            MyAccountItem(
                title: 'المحفظه',
                icon: const Icon(
                  Icons.wallet,
                  color: Color(backgroundcustomgreen),
                ),
                ontap: () {
                  GoRouter.of(context).push(AppRoutes.pms2);
                }),
                MyAccountItem(
                title: 'ماذا عنا',
                icon: const Icon(
                  Icons.info_outline,
                  color: Color(backgroundcustomgreen),
                ),
                ontap: () {
                  GoRouter.of(context).push(AppRoutes.aus);
                }),
            MyAccountItem(
                title: 'الدعم الفنى',
                icon: const Icon(
                  Icons.supervised_user_circle,
                  color: Color(backgroundcustomgreen),
                ),
                ontap: () {
                  GoRouter.of(context).push(AppRoutes.tss);
                }),
            MyAccountItem(
                title: 'سياسة الخصوصيه',
                icon: const Icon(
                  Icons.privacy_tip,
                  color: Color(backgroundcustomgreen),
                ),
                ontap: () {
                  GoRouter.of(context).push(AppRoutes.prs);
                }),
            MyAccountItem(
                title: 'الشروط والاحكام',
                icon: const Icon(
                  Icons.article,
                  color: Color(backgroundcustomgreen),
                ),
                ontap: () {
                  GoRouter.of(context).push(AppRoutes.rs2);
                }),
            BlocConsumer<LogOutCubit, LogOutState>(
              listener: (context, state) {
                if (state is LogOutSuccess) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                  GoRouter.of(context).push(AppRoutes.rs);
                } else if (state is LogOutFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.errMsg)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: LinearProgressIndicator()));
                }
              },
              builder: (context, state) {
                return MyAccountItem(
                  title: 'تسجيل خروج',
                  icon: const Icon(
                    Icons.logout,
                    color: Color(backgroundcustomgreen),
                  ),
                  ontap: () {
                    _logOutHandler(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logOutHandler(BuildContext context) {
    _checkLoginStatus().then((isLogin) {
      if (isLogin) {
        context.read<LogOutCubit>().fetchLogOUT();
        print('Logged out');
        GoRouter.of(context).push(AppRoutes.rs);

        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool(sharedIslogin, false);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You did not log in to log out')));
      }
    });
  }

  Future<bool> _checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedIslogin) ?? false;
  }
}
