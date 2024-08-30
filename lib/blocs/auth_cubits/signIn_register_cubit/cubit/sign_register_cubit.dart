// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/Auth_repos/signIn_register_repo/signin_register_repo.dart';
import 'package:hezma/Data/models/auth_models/login_model/data.dart';

part 'sign_register_state.dart';

class SignRegisterCubit extends Cubit<SignRegisterState> {
  SignInRegisterRepo signInRegisterRepo;
  SignRegisterCubit(this.signInRegisterRepo) : super(SignRegisterInitial());

  Future<void> fetchLogindata({
    required String emailOrphone,
    required String password,
    required bool isphone ,
  }) async {
    emit(SignRegisterloading());
    var result = await signInRegisterRepo.signInRepo(emailOrphone: emailOrphone, password: password, isphone: isphone);
    result.fold((failure) {
      print('There is an error in fetch login data ${failure.errorMSG}');
      emit(SignRegisterfailure(failure.errorMSG));
    }, (data) {
      print('SignRegistersuccess');

      emit(SignRegistersuccess(data));
    });
  }
}
