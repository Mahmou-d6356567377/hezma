import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/models/home_models/home_products_model/product.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/Active_code_screan/ActivationCodeScreen.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/build_accont_screan/build_acount_screan.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/register_screan/register_screan.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/payment_screan/payment_screan.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Item_screan/Item_screan.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Kesm_Khdar_screan/Kesm_Khdar_screan.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Kesm_fakh_screan/Kesm_fakh_screan.dart';
import 'package:hezma/UI/presentation/Views/home_screans/Kesm_water_screan/Kesm_water_screan.dart';
import 'package:hezma/UI/presentation/Views/home_screans/katlog_hezma_screan/katlog_hezma_screan.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/main_screan1.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/widgets/custom_buttom_navigation_bar.dart';
import 'package:hezma/UI/presentation/Views/home_screans/notification_screan/notificatoin_screan.dart';
import 'package:hezma/UI/presentation/Views/home_screans/onBoarding_screan/onBoarding_screan.dart';
import 'package:hezma/UI/presentation/Views/intro_screans/splash_screan/splash_view.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/Map_screan/map_screan.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/PaymentScrean2/Payment_screan2.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/addresses_screan/addresses_screan.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/addresses_screan/widgets/create_address_screan.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/addresses_screan/widgets/edit_address_screan.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/follow_screan/follow_screan.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/modfiy_account_screan/modify_account_screan.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/my_orders_screan/MyOrdersScrean.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/privacy_rules_screan/privacy_rules_screan.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/rules_screan/rules_screan.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/technical_support_screan/technical_spuuort_screan.dart';

abstract class AppRoutes {
  static const sps = '/splashScrean';
  static const os = '/OnboardingScrean';
  static const rs = '/registerScrean';
  static const bas = '/BuildAccountScrean';
  static const acs = '/ActivationCodeScreen';
  static const ms = '/mainScrean';
  static const ks = '/KatlogHezmaScrean';
  static const ks1 = '/KesmKhdarScrean';
  static const ks2 = '/KesmWaterScrean';
  static const ks3 = '/KesmFakhScrean';
  static const kIIs = '/ItemScrean';
  static const ns = '/NotificationScrean';
  static const cpns = '/Custom_buttom_navigation_bar';
  static const mps = '/MapScrean';
  static const pms = '/PaymentScrean';
  static const pms2 = '/PaymentScrean2';
  static const mas = '/modifyaccountscrean';
  static const mos = '/MyorderScrean';
  static const fs = '/FollowScrean';
  static const ads = '/AddressesScrean';
  static const tss = '/TechnicalSupportScrean';
  static const prs = '/Privacyrulesscrean';
  static const rs2 = '/rulesscrean';
  static const eas = '/EditAddressScrean';
  static const cas = '/CreateAddressScrean';

  static final GoRouter router = GoRouter(initialLocation: sps, routes: [
    GoRoute(
        path: sps,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go splash View');
          return const SplashView();
        }),
    GoRoute(
        path: os,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to ONBoardingScrean');
          return const OnBoardingScrean();
        }),
    GoRoute(
        path: rs,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to RegisterScrean');
          return const RegisterScrean();
        }),
    GoRoute(
        path: bas,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to BuildAccountScrean');
          return const BuildAccountScrean();
        }),
    GoRoute(
        path: acs,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to ActivationCodeScreen');
          return const ActivationCodeScreen();
        }),
    GoRoute(
        path: ms,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to Main Screan1 ');
          return const MainScrean1();
        }),
    GoRoute(
        path: ks,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to Main KatlogHezma Screan ');
          return const KatologHezmaScrean();
        }),
    GoRoute(
        path: ks1,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to Main KatlogHezma Screan ');
          return const KesmKhdarScrean();
        }),
    GoRoute(
        path: ks2,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to Main KatlogHezma Screan ');
          return const KesmWaterScrean();
        }),
    GoRoute(
        path: ks3,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to Main KatlogHezma Screan ');
          return const KesmfakhScrean();
        }),
    GoRoute(
        path: kIIs,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to Main Item Screan ');
          return ItemScrean(
            productdetails:
                (state.extra as Map<String, dynamic>)['product'] as Product,
            rating: (state.extra as Map<String, dynamic>)['rating'] as double,
          );
        }),
    GoRoute(
        path: ns,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Notification Screan ');
          return const NotificationScrean();
        }),
    GoRoute(
        path: cpns,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to Main customButtonNavigation bar  Screan ');
          return const Custom_buttom_navigation_bar();
        }),
    GoRoute(
        path: mps,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Map Screan ');
          return const MapScrean();
        }),
    GoRoute(
        path: pms,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Payment Screan ');
          return const PaymentScrean();
        }),
    GoRoute(
        path: mas,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Payment Screan ');
          return ModifyAccountScrean();
        }),
    GoRoute(
        path: mos,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  MyOrder Screan ');
          return const MyOrderScrean();
        }),
    GoRoute(
        path: fs,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Follow Screan ');
          return const FollowScrean(id2: 4);
        }),
    GoRoute(
        path: ads,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Addresses Screan ');
          return const AddressesScrean();
        }),
    GoRoute(
        path: pms2,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  payment2 Screan');
          return const PaymentScrean2();
        }),
    GoRoute(
        path: tss,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  TechnicalSupport Screan');
          return const TechnicalSupportScrean();
        }),
    GoRoute(
        path: prs,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  PrivacyRules Screan');
          return const PrivacyRulesScrean();
        }),
    GoRoute(
        path: rs2,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Rules Screan');
          return const RulesScrean();
        }),
    GoRoute(
        path: eas,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Edit Addresses Screan ');
          final AddressData addressData = state.extra as AddressData;
          return EditAddressScrean(place: addressData);
        }),
    GoRoute(
        path: cas,
        builder: (context, state) {
          // ignore: avoid_print
          print('Go to  Create Address Screan');
          return const CreateAddressScrean();
        }),
  ]);
}
