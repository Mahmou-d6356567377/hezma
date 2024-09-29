part of 'setting_cubit.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}
final class SettingLoading extends SettingState {}
final class SettingFailure extends SettingState {
  final String errMsg;

  const SettingFailure(this.errMsg);
}
final class SettingSuccess extends SettingState {
  final List<settingModel1> settings;

 const SettingSuccess(this.settings);
}
