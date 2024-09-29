import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo.dart';

part 'cancelorder_state.dart';

class CancelorderCubit extends Cubit<CancelorderState> {
  CancelorderCubit(this.myOrderRepo) : super(CancelorderInitial());
  MyOrderRepo myOrderRepo;
  Future<void> cancelOrderFun({required int id}) async {
    emit(CancelorderLoading());
    var result = await myOrderRepo.cancelOrder(id: id);
    result.fold((failure) {
      emit(CancelorderFailure(failure.errorMSG));
    }, (succMsg) {
      emit(CancelorderSuccess(succMsg));
    });
  }
}
