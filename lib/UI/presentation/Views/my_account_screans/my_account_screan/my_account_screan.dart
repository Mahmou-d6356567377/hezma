import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/Repo/log_out_repo/log_out_repo_IMPL.dart';
import 'package:hezma/blocs/log_out_cubit/cubit/log_out_cubit.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/service_locator/service_locator.dart';
import 'widgets/account_screan_content.dart';

class MyAccountScrean extends StatelessWidget {
  const MyAccountScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person),
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
