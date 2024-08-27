part of 'first_imge_cubit.dart';

sealed class FirstImgeState extends Equatable {
  const FirstImgeState();

  @override
  List<Object> get props => [];
}

final class FirstImgeInitial extends FirstImgeState {}

final class FirstImgeLoading extends FirstImgeState {}

final class FirstImgeSuccess extends FirstImgeState {
  final List<Slider> slideImge;

  const FirstImgeSuccess(this.slideImge);
}

final class FirstImgeFailure extends FirstImgeState {
  final String errMsg;

  const FirstImgeFailure(this.errMsg);
}
