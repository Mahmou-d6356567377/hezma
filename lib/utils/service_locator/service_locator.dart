import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hezma/Data/Repo/Auth_repos/log_out_repo/log_out_repo_IMPL.dart';
import 'package:hezma/Data/Repo/Auth_repos/otp_repo/otp_repo_IMPL.dart';
import 'package:hezma/Data/Repo/Auth_repos/signIn_register_repo/signin_register_repo_IMPL.dart';
import 'package:hezma/Data/Repo/cart_repos/cart_product_repo/cart_product_repo_IMPL.dart';
import 'package:hezma/Data/Repo/cart_repos/cart_product_repo/make_order_repo/make_order_repo_IMPL.dart';
import 'package:hezma/Data/Repo/cart_repos/pay_methods_repos/pay_methods_repo_IMPL.dart';
import 'package:hezma/Data/Repo/cart_repos/varify_coupon_repo/varify_coupon_repo_IMPL.dart';
import 'package:hezma/Data/Repo/fav_products_repo/fav_product_repo_IMPL.dart';
import 'package:hezma/Data/Repo/home_products_repo/home_product_repo_Impl.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/addresses_repo/addresses_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/districts_repo/districts_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/my_orders_repo/my_orders_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/profile_repo/profile_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/terms_repo/terms_repo_IMPL.dart';
import 'package:hezma/Data/Repo/my_account_screan_repos/wallet_repo/wallet_repo_IMPL.dart';
import 'package:hezma/utils/API/api_service.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeProductRepoIMPL>(
      HomeProductRepoIMPL(getIt.get<ApiService>()));

  getIt.registerSingleton<FavProductRepoImpl>(
      FavProductRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<AddressesRepoImpl>(
      AddressesRepoImpl(getIt.get<ApiService>()));

  getIt
      .registerSingleton<TermsRepoImpl>(TermsRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<DistrictsRepoImpl>(
      DistrictsRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<SignInRegisterRepoIMPL>(
      SignInRegisterRepoIMPL(getIt.get<ApiService>()));

  getIt.registerSingleton<OtpRepoImpl>(OtpRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<LogOutRepoImpl>(
      LogOutRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<WalletRepoImpl>(
      WalletRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<MyOrdersRepoImpl>(
      MyOrdersRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<PayMethodsRepoImpl>(
      PayMethodsRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<ProfileRepoImpl>(
      ProfileRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<CartProductRepoImpl>(
      CartProductRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<VarifyCouponRepoImpl>(
      VarifyCouponRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<MakeOrderRepoImpl>(
      MakeOrderRepoImpl(getIt.get<ApiService>()));
}
