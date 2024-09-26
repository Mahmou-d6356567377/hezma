import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/widgets/listItem.dart';
import 'package:hezma/blocs/home_cubits/category_products_cubit/category_products_cubit.dart';

class CustomGridView2 extends StatefulWidget {
  const CustomGridView2({
    super.key,
    required this.subCategoryId,
  });
  final String subCategoryId;

  @override
  State<CustomGridView2> createState() => _CustomGridView2State();
}

class _CustomGridView2State extends State<CustomGridView2> {
  @override
  void initState() {
    context
        .read<CategoryProductsCubit>()
        .fetchSubCategoriesProducts(widget.subCategoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (context, state) {
        if (state is CategoryProductsSuccess) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 10,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: state.categoryProducts.length,
              itemBuilder: (context, index) {
                return ListItem(productModel: state.categoryProducts[index]);
              });
        } else if (state is CategoryProductsFailure) {
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
