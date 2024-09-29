import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_card_details/datum.dart';

part 'mycanceled_order_state.dart';

class MycanceledOrderCubit extends Cubit<MycanceledOrderState> {
  MycanceledOrderCubit(this.myOrderRepo) : super(MycanceledOrderInitial());
  MyOrderRepo myOrderRepo;
  Future<void> fetchcanceledOrders() async {
    emit(MycanceledOrderLoading());
    var result = await myOrderRepo.fetchcanceledOrders();
    result.fold((failure) {
      emit(MycanceledOrderFailure(failure.errorMSG));
    }, (canceledOrders) {
      emit(MycanceledOrderSuccess(canceledOrders));
    });
  }
}
