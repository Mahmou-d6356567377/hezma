import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<Product> _cartProducts = [];

  CartCubit() : super(CartInitial());

  void addProductToCart(Product product) {
    _cartProducts.add(product);
    _emitSuccessState();
  }

  void fetchCartProducts() {
    emit(CartLoading());
    if (_cartProducts.isNotEmpty) {
      _emitSuccessState();
    } else {
      emit(CartInitial());
    }
  }

  void removeProductFromCart(Product product) {
    _cartProducts.remove(product);
    _emitSuccessState();
  }

  void _emitSuccessState() {
    final totalPrice = _cartProducts.fold(
      0,
      (sum, item) {
        int price = int.parse(item.price!);
        return sum + price;
      },
    );
    emit(CartSuccess(_cartProducts, totalPrice));
  }
}
