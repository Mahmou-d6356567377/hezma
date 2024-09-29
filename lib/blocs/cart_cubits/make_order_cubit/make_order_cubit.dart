import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/cart_repos/cart_product_repo/make_order_repo/make_order_repo.dart';

part 'make_order_state.dart';

class MakeOrderCubit extends Cubit<MakeOrderState> {
  MakeOrderCubit(this.makeOrderRepo) : super(MakeOrderInitial());
  MakeOrderRepo makeOrderRepo;

  Future<void> makeOrderFunC({
    required int paymethodId,
    required int addressId,
    required int timeId,
    required String date,
    required String shipping,
    String? coupon,
    String? userName,
    String? bankName,
    File? img,
  }) async {
    emit(MakeOrderLoading());
    var result = await makeOrderRepo.makeOrderFun(
        paymethodId: paymethodId,
        addressId: addressId,
        timeId: timeId,
        date: date,
        shipping: shipping);
    result.fold((failure) {
      emit(MakeOrderFailure(failure.errorMSG));
    }, (sucMsg) {
      emit(MakeOrderSuccess(sucMsg));
    });
  }
}
