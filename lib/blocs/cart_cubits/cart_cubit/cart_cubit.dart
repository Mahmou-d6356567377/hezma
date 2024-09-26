import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/cart_repos/cart_product_repo/cart_product_repo.dart';
import 'package:hezma/Data/models/cart_models/cart_product/datum.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartProductRepo cartProductRepo;

  CartCubit(this.cartProductRepo) : super(CartInitial());

  Future<void> fetchCartProducts() async {
    emit(CartLoading());

    var result = await cartProductRepo.fetchCartProducts();
    double totalPrice = 0;

    result.fold(
      (failure) {
        emit(CartFailure(failure.errorMSG));
      },
      (products) {
        // Calculate the total price
        for (var product in products) {
          totalPrice += double.parse(product.totalPrice ?? '0');
        }

        // Emit CartSuccess with products and totalPrice
        emit(CartSuccess(cartProducts: products, totalPrice: totalPrice));
      },
    );
  }
}
