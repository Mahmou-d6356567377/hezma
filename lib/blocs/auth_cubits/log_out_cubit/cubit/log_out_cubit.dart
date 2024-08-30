import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/Auth_repos/log_out_repo/log_out_repo.dart';
part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this.logOutRepo) : super(LogOutInitial());
  final LogOutRepo logOutRepo;
  
  Future<void> fetchLogOUT () async{
   emit(LogOutLoading());
  
   var logoutresponce = await logOutRepo.logoutSummon();
   logoutresponce.fold((failure){
    emit(LogOutFailure(failure.errorMSG));
   }, (message){
   emit(LogOutSuccess(message));
   }
   );
  }
}
