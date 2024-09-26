import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hezma/UI/presentation/Views/home_screans/katlog_hezma_screan/widgets/listItem1.dart';

class CustomGridView1 extends StatelessWidget {
  const CustomGridView1({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          childAspectRatio: 7 / 5,
          mainAxisSpacing: 20.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ListItem1();
        });
  }
}
