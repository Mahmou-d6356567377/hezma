import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/Data/Repo/Auth_repos/otp_repo/otp_repo_IMPL.dart';
import 'package:hezma/Data/Repo/Auth_repos/signIn_register_repo/signin_register_repo_IMPL.dart';
import 'package:hezma/Data/Repo/fav_products_repo/fav_product_repo_IMPL.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo_Impl.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/addresses_repo/addresses_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/districts_repo/districts_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/terms_repo/terms_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/wallet_repo/wallet_repo_IMPL.dart';
import 'package:hezma/blocs/auth_cubits/otp_cubit/otp_cubit.dart';
import 'package:hezma/blocs/auth_cubits/receive_otp_cubit/receive_otp_cubit.dart';
import 'package:hezma/blocs/auth_cubits/register_cubit/register_cubit.dart';
import 'package:hezma/blocs/auth_cubits/signIn_register_cubit/cubit/sign_register_cubit.dart';
import 'package:hezma/blocs/cart_cubits/cart_cubit.dart';
import 'package:hezma/blocs/fav_screan_cubits/fav_products_cubit/cubit/fav_product_cubit.dart';
import 'package:hezma/blocs/home_cubits/category_products_cubit/category_products_cubit.dart';
import 'package:hezma/blocs/home_cubits/first_img_cubit/first_imge_cubit.dart';
import 'package:hezma/blocs/home_cubits/home_images_cubit/home_images_cubit.dart';
import 'package:hezma/blocs/home_cubits/home_product_cubit/home_product_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/create_address_cubit/create_address_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/del_address_cubit/del_address_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/edit_address_cubit/edit_address_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/get_addresses_cubit/get_addresses_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/district_places_cubit/district_places_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/my_orders_cubit/my_orders_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/order_details_cubit/order_details_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/terms_cubit/terms_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/wallet_cubit/wallet_cubit.dart';
import 'package:hezma/utils/routes.dart';
import 'package:hezma/utils/service_locator/service_locator.dart';

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
          create: (context) =>
              HomeProductCubit(getIt.get<HomeProductRepoIMPL>())
                ..fetchHomeProducts(),
        ),
        BlocProvider(
          create: (context) => OtpCubit(getIt.get<OtpRepoImpl>())..fetchOtp(),
        ),
        BlocProvider(
          create: (context) => ReceiveOtpCubit(getIt.get<OtpRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              DistrictPlacesCubit(getIt.get<DistrictsRepoImpl>())
                ..fetchDistrictPlaces(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryProductsCubit(getIt.get<HomeProductRepoIMPL>()),
        ),
        BlocProvider(
          create: (context) => HomeImagesCubit(getIt.get<HomeProductRepoIMPL>())
            ..fetchHomeImages(),
        ),
        BlocProvider(
          create: (context) => FirstImgeCubit(getIt.get<HomeProductRepoIMPL>())
            ..fetchHomeslider(),
        ),
        BlocProvider(
          create: (context) => FavProductCubit(getIt.get<FavProductRepoImpl>())
            ..fetchFavProductsCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..fetchCartProducts(),
        ),
        BlocProvider(
          create: (context) =>
              SignRegisterCubit(getIt.get<SignInRegisterRepoIMPL>()),
        ),
        BlocProvider(
            create: (context) =>
                RegisterCubit(getIt.get<SignInRegisterRepoIMPL>())),
        BlocProvider(
          create: (context) => DelAddressCubit(getIt.get<AddressesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => EditAddressCubit(getIt.get<AddressesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              CreateAddressCubit(getIt.get<AddressesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              TermsCubit(getIt.get<TermsRepoImpl>())..fetchTermsData(),
        ),
        BlocProvider(
          create: (context) =>
              GetAddressesCubit(getIt.get<AddressesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              WalletCubit(getIt.get<WalletRepoImpl>())..fetchWalletData(),
        ),
        BlocProvider(
          create: (context) =>
              MyOrdersCubit(getIt.get<MyOrdersRepoImpl>())..fetchMyOrders(),
        ),
        BlocProvider(
          create: (context) => OrderDetailsCubit(getIt.get<MyOrdersRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
