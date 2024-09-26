import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/widgets/listItem.dart';
import 'package:hezma/blocs/fav_screan_cubits/fav_products_cubit/cubit/fav_product_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomGridFav extends StatefulWidget {
  const CustomGridFav({
    super.key,
  });

  @override
  State<CustomGridFav> createState() => _CustomGridFavState();
}

class _CustomGridFavState extends State<CustomGridFav> {
  Future<bool> _getPreferenceValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedIslogin) ?? false;
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          actionsPadding: const EdgeInsets.all(16.0),
          title: const Icon(
            Icons.login_outlined,
            color: Color(backgroundcustomgreen),
          ),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'برجاء تسجيل الدخول',
                style: arabicstyle2,
              ),
            ],
          ),
          actions: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(backgroundcustomgreen),
                        textStyle: arabicstyle5,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: const Text(
                        'استكمال التصفح',
                        style: arabicstyle5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(backgroundcustomgreen),
                        textStyle: arabicstyle5,
                      ),
                      onPressed: () {
                        GoRouter.of(context).push(AppRoutes.rs);
                      },
                      child: const Text(
                        'تسجيل الدخول',
                        style: arabicstyle5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavProductCubit, FavProductState>(
      builder: (context, state) {
        if (state is FavProductSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 20.0,
            ),
            itemCount: state.favProducts.length,
            itemBuilder: (context, index) {
              return ListItem(
                productModel: state.favProducts[index],
              );
            },
          );
        } else if (state is FavProductFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showAlertDialog(context);
          });
          return const Center(
            child: Text('Failed to load favorites.'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
