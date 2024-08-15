import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/Repo/fav_products_repo/fav_product_repo_IMPL.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo_Impl.dart';
import 'package:hezma/blocs/fav_products_cubit/cubit/fav_product_cubit.dart';
import 'package:hezma/blocs/home_product_cubit/home_product_cubit.dart';
import 'package:hezma/utils/routes.dart';
import 'package:hezma/utils/service_locator/Service_locator.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
    serviceLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [


        BlocProvider(
          create: (context) => HomeProductCubit(getIt.get<HomeProductRepoIMPL>())..fetchHomeProducts(),
        ),
      
        BlocProvider(
          create: (context) => FavProductCubit(getIt.get<FavProductRepoImpl>())..fetchFavProductsCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
