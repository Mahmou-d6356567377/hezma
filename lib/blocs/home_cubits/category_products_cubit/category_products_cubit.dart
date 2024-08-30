import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this.subCategoriesRepo)
      : super(CategoryProductsInitial());

  HomeProductRepo subCategoriesRepo;
  Future<void> fetchSubCategoriesProducts(String categoryId) async {
    emit(CategoryProductsLoading());
    var result = await subCategoriesRepo.fetchCategoryProduct(categoryId);

    result.fold((failure) {
      emit(CategoryProductsFailure(failure.errorMSG));
    }, (product) {
      emit(CategoryProductsSuccess(product));
    });
  }
}
