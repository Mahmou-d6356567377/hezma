import 'package:bloc/bloc.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';

part 'home_product_state.dart';

class HomeProductCubit extends Cubit<HomeProductState> {
  final HomeProductRepo homeProductRepo;

  HomeProductCubit(this.homeProductRepo) : super(HomeProductInitial1());

  Future<void> fetchHomeProducts() async {
    emit(HomeProductLoading1());
    var result = await homeProductRepo.fetchHomeProduct();

    result.fold(
      (failure) {
        emit(HomeProductFailure1(failure.errorMSG));
      },
      (homeProducts) {
        emit(HomeProductSuccess1(homeProducts));
      },
    );
  }
}
