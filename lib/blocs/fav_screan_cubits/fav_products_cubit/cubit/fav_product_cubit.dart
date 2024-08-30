// ignore_for_file: avoid_print

import 'package:hezma/Data/Repo/fav_products_repo/fav_product_repo.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:bloc/bloc.dart';
part 'fav_product_state.dart';

class FavProductCubit extends Cubit<FavProductState> {
  final FavoriteProductRepo favProductRepo;
  FavProductCubit(this.favProductRepo) : super(FavProductInitial());

  Future<void> fetchFavProductsCubit() async {
    emit(FavProductLoading());
    var data = await favProductRepo.fetchFavProducts();

    data.fold((failure) {
      emit(FavProductFailure(failure.errorMSG));
      print('failed fetch favorite product cubit function');
    }, (favProducts) {
      final updatedFavProducts = favProducts.map((product) {
        product.isFavorite = true;
        return product;
      }).toList();

      emit(FavProductSuccess(updatedFavProducts));
      print('fetch favorite product cubit function');
    });
  }

  Future<void> addProductToFavorite(Product productModel) async {
    try {
      await favProductRepo.addFavProducts(productModel);
      print('add favorite cubit function');

      if (state is FavProductSuccess) {
        final updatedProducts =
            (state as FavProductSuccess).favProducts.map((p) {
          if (p.id == productModel.id) p.isFavorite = true;
          return p;
        }).toList();

        emit(FavProductSuccess(updatedProducts));
        fetchFavProductsCubit();
      }
    } catch (e) {
      emit(FavProductFailure('Error in Add Product Cubit $e'));
    }
  }

  Future<void> removeProductToFavorite(Product productModel) async {
    try {
      await favProductRepo.removeFavProducts(productModel);
      print('remove favorite cubit function');

      if (state is FavProductSuccess) {
        final updatedProducts =
            (state as FavProductSuccess).favProducts.map((p) {
          if (p.id == productModel.id) p.isFavorite = false;
          return p;
        }).toList();

        emit(FavProductSuccess(updatedProducts));
        fetchFavProductsCubit();
      }
    } catch (e) {
      emit(FavProductFailure('Error in Remove Product Cubit $e'));
    }
  }
}
