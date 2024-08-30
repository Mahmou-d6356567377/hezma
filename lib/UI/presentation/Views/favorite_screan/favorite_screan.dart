import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/favorite_screan/widgets/custom_crid_fav.dart';
import 'package:hezma/utils/fonts.dart';

class FavoriteScrean extends StatelessWidget {
  const FavoriteScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.favorite),
        centerTitle: true,
        title: const Text(
          'المفضله',
          style: arabicstyle2,
        ),
      ),
      body: const Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomGridFav(),
          )),
        ],
      ),
    );
  }
}
