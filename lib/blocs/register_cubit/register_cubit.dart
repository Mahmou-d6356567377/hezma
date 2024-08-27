import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/signIn_register_repo/signin_register_repo.dart';

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
