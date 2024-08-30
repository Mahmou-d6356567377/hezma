import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/widgets/listItem.dart';
import 'package:hezma/blocs/home_cubits/home_product_cubit/home_product_cubit.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({
    super.key,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeProductCubit>(context).fetchHomeProducts();
  }

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
              childAspectRatio: 9 / 10,
              mainAxisSpacing: 20.0, // Space between rows
            ),
            itemCount: state.porducts.length,
            itemBuilder: (context, index) {
              return ListItem(
                productModel: state.porducts[index],
              );
            },
          );
        } else if (state is HomeProductFailure1) {
          return const Center(child: Text('!'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
