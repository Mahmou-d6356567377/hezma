import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/blocs/home_cubits/first_img_cubit/first_imge_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/routes.dart';

class FirstImageWidget extends StatelessWidget {
  const FirstImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: BlocBuilder<FirstImgeCubit, FirstImgeState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: state is FirstImgeSuccess
                      ? GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.ks);
                          },
                          child: Image.network(
                            state.slideImge[0].image!,
                            fit: BoxFit.fill,
                          ),
                        )
                      : state is FirstImgeLoading
                          ? Center(
                              child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  color: Colors.grey[300]),
                            ))
                          : Center(
                              child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  color: Colors.red.shade100),
                            ))),
            ],
          );
        },
      ),
    );
  }
}
