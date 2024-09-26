import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/cart_repos/cart_product_repo/cart_product_repo.dart';

part 'cart_access_state.dart';

class CartAccessCubit extends Cubit<CartAccessState> {
  CartAccessCubit(this.cartProductRepo) : super(CartAccessInitial());
  CartProductRepo cartProductRepo;

  Future<void> addProductToCart(
      {required int productId,
      required String count,
      required String price}) async {
    print('1111111111111111111');
    emit(CartAccessLoading());
    var result = await cartProductRepo.addCartProduct(
        productId: productId, count: count, price: price);
    result.fold((failure) {
      emit(CartAccessFailure(failure.errorMSG));
    }, (succmsg) {
      emit(CartAccessSuccess(succmsg));
    });
  }

  Future<void> deleteCartProduct(
      {required int cartId, required int id, required String count}) async {
    print('22222222222');
    emit(CartAccessLoading());
    var result = await cartProductRepo.deleteCartProducts(
        cartId: cartId, id: id, count: count);

    result.fold((failure) {
      emit(CartAccessFailure(failure.errorMSG));
    }, (succmsg) {
      emit(CartAccessSuccess(succmsg));
    });
  }

  Future<void> updateCartProductfun(
      {required int cartId, required int count}) async {
    print('33333333333');
    emit(CartAccessLoading());
    var result =
        await cartProductRepo.updateCountProduct(cartid: cartId, count: count);

    result.fold((failure) {
      emit(CartAccessFailure(failure.errorMSG));
    }, (succmsg) {
      emit(CartAccessSuccess(succmsg));
    });
  }
}
