import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/widgets/category_row_image.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/widgets/custom_list_view.dart';
import 'package:hezma/UI/presentation/Views/home_screans/main_screan1/widgets/first_image_widget.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

class Custom_scroll_view extends StatelessWidget {
  const Custom_scroll_view({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FirstImageWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'الاقسام',
                      style: arabicstyle1,
                    )
                  ],
                ),
              ),
              const CategoryRowImage(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRoutes.ks);
                      },
                      child: const Text(
                        'الكل',
                        style: arabicstyle1,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'المنتجات',
                      style: arabicstyle1,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomGridView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
