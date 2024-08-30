import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/main_screan1/widgets/listItem.dart';
import 'package:hezma/blocs/home_product_cubit/home_product_cubit.dart';

class CustomGridView3 extends StatelessWidget {
  const CustomGridView3({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductCubit, HomeProductState>(
      builder: (context, state) {
        if (state is HomeProductSuccess1) {
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListItem(productModel: state.porducts[index]);
              });
        } else if (state is HomeProductFailure1) {
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
