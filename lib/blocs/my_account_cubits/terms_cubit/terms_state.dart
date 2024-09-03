part of 'terms_cubit.dart';

sealed class TermsState extends Equatable {
  const TermsState();

  @override
  List<Object> get props => [];
}

final class TermsInitial extends TermsState {}
final class TermsLoading extends TermsState {}
final class TermsSuccess extends TermsState {
  final String value ;

  const TermsSuccess(this.value);
}
final class TermsFailure extends TermsState {
  final String errMsg;

 const  TermsFailure(this.errMsg);
}
