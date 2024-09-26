part of 'cancelorder_cubit.dart';

sealed class CancelorderState extends Equatable {
  const CancelorderState();

  @override
  List<Object> get props => [];
}

final class CancelorderInitial extends CancelorderState {}
final class CancelorderLoading extends CancelorderState {}
final class CancelorderFailure extends CancelorderState {
  final String errMsg;

  const CancelorderFailure(this.errMsg);
}
final class CancelorderSuccess extends CancelorderState {
  final String succMsg;

  const CancelorderSuccess(this.succMsg);
}
