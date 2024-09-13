import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/profile_repo/profile_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/profile/data.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  ProfileRepo profileRepo;

  Future<void> fetchProfileData () async {
    emit(ProfileLoading());
    var result = await profileRepo.fetchProfileData();

    result.fold((failure){
         emit(ProfileFailure(failure.errorMSG));
    }, (data){
        emit(ProfileSuccess(data));
    });
  }
}
