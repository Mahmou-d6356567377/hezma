import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/blocs/home_cubits/home_images_cubit/home_images_cubit.dart';
import 'package:hezma/utils/routes.dart';

class CategoryRowImage extends StatelessWidget {
  const CategoryRowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BlocBuilder<HomeImagesCubit, HomeImagesState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _buildImageItem(
                  context,
                  state,
                  index: 0,
                  route: AppRoutes.ks1,
                ),
                _buildImageItem(
                  context,
                  state,
                  index: 1,
                  route: AppRoutes.ks4,
                ),
                _buildImageItem(
                  context,
                  state,
                  index: 2,
                  route: AppRoutes.ks3,
                ),
                _buildImageItem(
                  context,
                  state,
                  index: 3,
                  route: AppRoutes.ks2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Helper method to build each image item
  Widget _buildImageItem(
    BuildContext context,
    HomeImagesState state, {
    required int index,
    required String route,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: state is HomeImagesSuccess
          ? GestureDetector(
              onTap: () {
                GoRouter.of(context).push(route);
              },
              child: Image.network(state.homeImages[index].image!),
            )
          : state is HomeImagesLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                  )),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red.shade100,
                  )),
                ),
    );
  }
}
