import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_card_details/datum.dart';

part 'prev_orders_list_state.dart';

class PrevOrdersListCubit extends Cubit<PrevOrdersListState> {
  PrevOrdersListCubit(this.myOrderRepo) : super(PrevOrdersListInitial());
   MyOrderRepo myOrderRepo ;
  Future<void> fetchPrevOrders () async {
    emit(PrevOrdersListLoading());
    var result = await myOrderRepo.fetchMyPreviousOrders();
    result.fold((failure){
      emit(PrevOrdersListFailure(failure.errorMSG));
    }, (canceledOrders){
      emit(PrevOrdersListSuccess(canceledOrders));
    });
  }
}
