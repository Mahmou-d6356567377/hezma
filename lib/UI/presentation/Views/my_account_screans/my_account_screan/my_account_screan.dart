import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/Repo/Auth_repos/log_out_repo/log_out_repo_IMPL.dart';
import 'package:hezma/blocs/auth_cubits/log_out_cubit/cubit/log_out_cubit.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';
import 'package:hezma/utils/service_locator/service_locator.dart';
import 'widgets/account_screan_content.dart';

class MyAccountScrean extends StatelessWidget {
  const MyAccountScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.ps);
          },
          icon: const Icon(Icons.person),
        ),
        title: const Text(
          'حسابى',
          style: arabicstyle2,
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => LogOutCubit(getIt.get<LogOutRepoImpl>()),
        child: const AccountScreanContent(),
      ),
    );
  }
}
