import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo.dart';
import 'package:hezma/Data/models/my_account_screan_models/order_details_model/data.dart';
part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.myOrderRepo) : super(OrderDetailsInitial());
  MyOrderRepo myOrderRepo;
  Future<void> fetchOrderDatails({required int id}) async {
    emit(OrderDetailsLoading());
    var result = await myOrderRepo.fetchMyOrdersData(id: id);
    result.fold((failure) {
      print(failure.errorMSG);
      emit(OrderDetailsFailure(failure.errorMSG));
    }, (data) {
      print(data);
      emit(OrderDetailsISuccess(data));
    });
  }
}
