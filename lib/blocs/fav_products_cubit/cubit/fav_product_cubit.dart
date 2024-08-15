import 'package:hezma/Data/Repo/fav_products_repo/fav_product_repo.dart';
import 'package:hezma/Data/models/home_products_model/product.dart';
import 'package:bloc/bloc.dart';
part 'fav_product_state.dart';

class FavProductCubit extends Cubit<FavProductState> {
  final FavoriteProductRepo favProductRepo;
  FavProductCubit(this.favProductRepo) : super(FavProductInitial());

  Future<void> fetchFavProductsCubit() async{
   
      emit(FavProductLoading());
     var data =  await favProductRepo.fetchFavProducts();
     data.fold(
      (failure ){
        emit(FavProductFailure(failure.errorMSG));
      }, (favProducts){
       emit(FavProductSuccess(favProducts));
      }
      );
  
  }
}
