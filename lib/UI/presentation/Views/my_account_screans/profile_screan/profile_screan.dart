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
                    child: state is ProfileSuccess
                        ? Image.network(state.profileData.image!)
                        : const Icon(Icons.person, size: 50),
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
                    child: Text('Your Id : ${ state is ProfileSuccess ? state.profileData.id : state is ProfileFailure ? Text(state.errMsg) : const CircularProgressIndicator() } ',
                      style: arabicstyle2,),
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
                    child: Text('Name  : ${ state is ProfileSuccess ? state.profileData.name : state is ProfileFailure ? Text(state.errMsg) : const CircularProgressIndicator() } ',
                     style: arabicstyle2,),
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
                    child: Text('Email : ${ state is ProfileSuccess ? state.profileData.email : state is ProfileFailure ? Text(state.errMsg) : const CircularProgressIndicator() }',
                     style: arabicstyle2,),
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
                    child: Text(
                      'Phone : ${ state is ProfileSuccess ? state.profileData.phone : state is ProfileFailure ? Text(state.errMsg) : const CircularProgressIndicator() }',
                      style: arabicstyle2,
                    ),
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
