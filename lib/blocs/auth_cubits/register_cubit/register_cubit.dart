import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/Auth_repos/signIn_register_repo/signin_register_repo.dart';
import 'package:hezma/Data/models/auth_models/login_model/data.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.signInRegisterRepo) : super(RegisterInitial());
  SignInRegisterRepo signInRegisterRepo;

  Future<void> fetchRegisterdata(Map<String, dynamic> body) async {
    emit(Registerloading());
    var result = await signInRegisterRepo.registerRepo(body);
    result.fold((failure) {
      emit(Registerfailure(failure.errorMSG));
    }, (data) {
      emit(Registersuccess(data));
    });
  }
}
