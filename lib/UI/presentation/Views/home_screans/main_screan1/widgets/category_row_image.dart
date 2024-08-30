import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/blocs/home_images_cubit/home_images_cubit.dart';
import 'package:hezma/utils/routes.dart';

class CategoryRowImage extends StatelessWidget {
  const CategoryRowImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BlocBuilder<HomeImagesCubit, HomeImagesState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: state is HomeImagesSuccess
                    ? GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRoutes.ks1);
                        },
                        child: Image.network(state.homeImages[0].image!),
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
                        : const Center(child: Text('!')),
              ),
              Expanded(
                child: state is HomeImagesSuccess
                    ? GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRoutes.ks3);
                        },
                        child: Image.network(state.homeImages[1].image!),
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
                        : const Center(child: Text('!')),
              ),
              Expanded(
                child: state is HomeImagesSuccess
                    ? GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRoutes.ks2);
                        },
                        child: Image.network(state.homeImages[2].image!),
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
                        : const Center(child: Text('!')),
              ),
            ],
          );
        },
      ),
    );
  }
}
