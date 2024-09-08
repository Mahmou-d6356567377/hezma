import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/terms_repo/terms_repo.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit(this.termsRepo) : super(TermsInitial());
  TermsRepo termsRepo;

  Future<void> fetchTermsData() async {
    emit(TermsLoading());
    var result = await termsRepo.fetchTerms();
    result.fold((failure) {
      emit(TermsFailure(failure.errorMSG));
    }, (terms) {
      print(terms);
      emit(TermsSuccess(terms));
    });
  }
}
