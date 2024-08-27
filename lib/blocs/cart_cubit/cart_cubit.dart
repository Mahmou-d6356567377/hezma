import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/cart_repo/cart_repo.dart';
import 'package:hezma/Data/models/cart_model/datum.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartProductRepo cartProductRepo;
  CartCubit(this.cartProductRepo) : super(CartInitial());

  Future<void> fetchCartProducts() async {
    emit(CartLoading());
    var result = await cartProductRepo.fetchCartProduct();

    result.fold(
      (failure) {
        emit(CartFailure(failure.errorMSG));
      },
      (cartProducts) {
        emit(CartSuccess(cartProducts));
      },
    );
  }
}
