import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/blocs/my_account_cubits/profile_cubit/profile_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class ProfileScrean extends StatelessWidget {
  const ProfileScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: arabicstyle2,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<ProfileCubit>().fetchProfileData();
              },
              icon: const Icon(Icons.sync))
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 125,
                    backgroundImage: state is ProfileSuccess
                        ? NetworkImage(state.profileData.image!)
                        : null,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: customBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 12),
                    child: state is ProfileSuccess
                        ? Text(
                            'Your Id : ${state.profileData.id}',
                            style: arabicstyle2,
                          )
                        : state is ProfileFailure
                            ? Text(state.errMsg)
                            : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: customBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 12),
                    child: state is ProfileSuccess
                        ? Text(
                            'Name  : ${state.profileData.name} ',
                            style: arabicstyle2,
                          )
                        : state is ProfileFailure
                            ? Text(state.errMsg)
                            : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: customBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 12),
                    child: state is ProfileSuccess
                        ? Text(
                            'Email : ${state.profileData.email}',
                            style: arabicstyle2,
                          )
                        : state is ProfileFailure
                            ? Text(state.errMsg)
                            : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: customBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 12),
                    child: state is ProfileSuccess
                        ? Text(
                            'Phone : ${state.profileData.phone}',
                            style: arabicstyle2,
                          )
                        : state is ProfileFailure
                            ? Text(state.errMsg)
                            : null,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
