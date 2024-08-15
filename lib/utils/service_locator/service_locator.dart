import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hezma/Data/Repo/fav_products_repo/fav_product_repo_IMPL.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo_Impl.dart';
import 'package:hezma/utils/API/api_service.dart';

final getIt = GetIt.instance;

void serviceLocator (){
  getIt.registerSingleton<HomeProductRepoIMPL>( HomeProductRepoIMPL(ApiService(Dio())));
  getIt.registerSingleton<FavProductRepoImpl>( FavProductRepoImpl(ApiService(Dio())));
}