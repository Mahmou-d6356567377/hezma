import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo.dart';
import 'package:hezma/Data/models/home_products_model/category.dart';

part 'home_images_state.dart';

class HomeImagesCubit extends Cubit<HomeImagesState> {
  HomeImagesCubit(this.homeProductRepo) : super(HomeImagesInitial());
  final HomeProductRepo homeProductRepo;
  Future<void> fetchHomeImages() async {
    emit(HomeImagesLoading());
    var result = await homeProductRepo.fetchHomeImages();

    result.fold(
      (failure) {
        emit(HomeImagesFailure(failure.errorMSG));
      },
      (homeImages) {
        emit(HomeImagesSuccess(homeImages));
      },
    );
  }
}
