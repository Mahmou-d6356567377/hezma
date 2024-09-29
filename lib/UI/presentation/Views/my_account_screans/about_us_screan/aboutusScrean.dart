import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/blocs/my_account_cubits/setting_cubit/setting_cubit.dart';
import 'package:hezma/utils/fonts.dart';

class AboutUsScrean extends StatelessWidget {
  const AboutUsScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
         'معلومات عنا',
          style: arabicstyle2,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocBuilder<SettingCubit, SettingState>(
            
            builder: (context, state) {
          if (state is SettingSuccess) {
              print(state.settings[7].value);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(state.settings[5].value ?? 'There is no Data'),
                  ],
                ),
              ),
            );
          } else if (state is SettingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        },
          ),
        ),
      ),
    );
  }
}
