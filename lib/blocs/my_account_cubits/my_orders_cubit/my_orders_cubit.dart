import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this.myOrderRepo) : super(MyOrdersInitial());

  MyOrderRepo myOrderRepo;

  Future<void> fetchMyOrders() async {
    emit(MyOrdersLoading());
    var result = await myOrderRepo.fetchMyOrders();

    result.fold((failure) {
      emit(MyOrdersFailure(failure.errorMSG));
    }, (orders) {
      emit(MyOrdersSuccess(orders));
    });
  }
}
