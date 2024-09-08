import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/blocs/my_account_cubits/terms_cubit/terms_cubit.dart';
import 'package:hezma/utils/fonts.dart';

class RulesScrean extends StatelessWidget {
  const RulesScrean({super.key});

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
          'الشروط والاحكام',
          style: arabicstyle2,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TermsCubit, TermsState>(
        builder: (context, state) {
          if (state is TermsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(state.value),
                  ],
                ),
              ),
            );
          } else if (state is TermsLoading) {
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
    );
  }
}
