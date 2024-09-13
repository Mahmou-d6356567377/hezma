import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<Product> _cartProducts = [];

  CartCubit() : super(CartInitial());

  void addProductToCart(Product product) {
    final existingProduct = _cartProducts.firstWhere(
      (p) => p.id == product.id,
      orElse: () => product,
    );

    if (_cartProducts.contains(existingProduct)) {
      final index = _cartProducts.indexOf(existingProduct);
      _cartProducts[index] = existingProduct.copyWith(
        quantity: existingProduct.quantity + 1,
      );
    } else {
      _cartProducts.add(product);
    }

    _emitSuccessState();
  }

  void updateProductQuantity(Product product, int newQuantity) {
    final index = _cartProducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _cartProducts[index] =
          _cartProducts[index].copyWith(quantity: newQuantity);
    }
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
        int price = int.parse(item.price!) * item.quantity;
        return sum + price;
      },
    );
    emit(CartSuccess(_cartProducts, totalPrice));
  }
}
