import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/settings_repo/settings_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/setting_model/datum.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.settingsRepo) : super(SettingInitial());
  SettingsRepo settingsRepo;

  Future<void> fetchsettingsFun() async{
    emit(SettingLoading());
    var result = await settingsRepo.fetchSettings();
    result.fold((failure){
      emit(SettingFailure(failure.errorMSG));
    }, (succ){
      emit(SettingSuccess(succ));
    });
  }
}
