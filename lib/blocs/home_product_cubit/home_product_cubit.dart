import 'package:bloc/bloc.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo.dart';
import 'package:hezma/Data/models/home_products_model/product.dart';

part 'home_product_state.dart';

class HomeProductCubit extends Cubit<HomeProductState> {
  HomeProductCubit( this.homeProductRepo) : super(HomeProductInitial());

    HomeProductRepo homeProductRepo ;

  Future<void> fetchHomeProducts  () async{
       emit(HomeProductLoading());
       var result = await  homeProductRepo.fetchHomeProduct();

      result.fold( 
        (failure){
 
           emit(HomeProductFailure(failure.errorMSG));
        }, (homeProduct){

          emit(HomeProductSuccess(homeProduct));
        }
        );   
      
  
  }
}
