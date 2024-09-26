part of 'updata_cubit_cubit.dart';

sealed class UpdataCubitState extends Equatable {
  const UpdataCubitState();

  @override
  List<Object> get props => [];
}

final class UpdataCubitInitial extends UpdataCubitState {}

final class UpdataCubitLoading extends UpdataCubitState {}

final class UpdataCubitFailure extends UpdataCubitState {
  final String errMsg;

  const UpdataCubitFailure(this.errMsg);
}

final class UpdataCubitSuccess extends UpdataCubitState {
  final String succMsg;

  const UpdataCubitSuccess(this.succMsg);
}
