import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/cart_repos/pay_methods_repos/pay_methods_repo.dart';
import 'package:hezma/Data/models/cart_models/pay_mothod_model/datum.dart';

part 'pay_mothod_state.dart';

class PayMothodCubit extends Cubit<PayMothodState> {
  PayMothodCubit(this.payMethodsRepo) : super(PayMothodInitial());
  PayMethodsRepo payMethodsRepo;
  Future<void> fetchPayMethods() async {
    emit(PayMothodLoading());
    var result = await payMethodsRepo.fetchPayMethods();
    result.fold((failure) {
      emit(PayMothodFailure(failure.errorMSG));
    }, (payMothods) {
      emit(PayMothodSuccess(payMothods));
    });
  }
}
