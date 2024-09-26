import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/blocs/home_cubits/first_img_cubit/first_imge_cubit.dart';

class FirstImageWidget extends StatelessWidget {
  const FirstImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: BlocBuilder<FirstImgeCubit, FirstImgeState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: state is FirstImgeSuccess
                    ? SizedBox(
                        height: 160, // Constrain the height of the ListView
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.slideImge.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 5,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              state.slideImge[index].image!,
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      )
                    : state is FirstImgeLoading
                        ? Center(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.grey[300],
                              ),
                            ),
                          )
                        : Center(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.red.shade100,
                              ),
                            ),
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}
