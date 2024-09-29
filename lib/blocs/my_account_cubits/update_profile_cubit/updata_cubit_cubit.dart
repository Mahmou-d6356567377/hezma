import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/profile_repo/profile_repo.dart';

part 'updata_cubit_state.dart';

class UpdataProfileCubit extends Cubit<UpdataCubitState> {
  UpdataProfileCubit(this.profileRepo) : super(UpdataCubitInitial());
  ProfileRepo profileRepo;

  Future<void> updateProfileData({
    required String name,
    required String phone,
    required String email,
    required String password,
    File? img,
  }) async {
    emit(UpdataCubitLoading());
    var result = await profileRepo.updateProfileData(
        name: name, phone: phone, email: email, password: password, image: img);
    result.fold((failure) {
      emit(UpdataCubitFailure(failure.toString()));
    }, (succMsg) {
      emit(UpdataCubitSuccess(succMsg));
    });
  }
}
