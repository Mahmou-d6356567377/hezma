import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo.dart';
import 'package:hezma/Data/models/home_products_model/slider.dart';

part 'first_imge_state.dart';

class FirstImgeCubit extends Cubit<FirstImgeState> {
  FirstImgeCubit(this.homeProductRepo) : super(FirstImgeInitial());
  final HomeProductRepo homeProductRepo;
  Future<void> fetchHomeslider() async {
    emit(FirstImgeLoading());
    var result = await homeProductRepo.fetchHomeslider();

    result.fold(
      (failure) {
        emit(FirstImgeFailure(failure.errorMSG));
      },
      (homesliderImages) {
        emit(FirstImgeSuccess(homesliderImages));
      },
    );
  }
}
