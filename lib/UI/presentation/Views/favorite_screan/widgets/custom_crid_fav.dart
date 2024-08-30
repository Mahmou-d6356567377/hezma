import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/widgets/listItem.dart';
import 'package:hezma/blocs/fav_screan_cubits/fav_products_cubit/cubit/fav_product_cubit.dart';

class CustomGridFav extends StatefulWidget {
  const CustomGridFav({
    super.key,
  });

  @override
  State<CustomGridFav> createState() => _CustomGridFavState();
}

class _CustomGridFavState extends State<CustomGridFav> {
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
                  isFavScrean: true,
                );
              });
        } else if (state is FavProductFailure) {
          return Text(state.errMsg);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
