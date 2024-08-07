

import 'package:flutter/cupertino.dart';
import 'package:hezma/UI/presentation/Views/main_screan1/widgets/listItem.dart';

class CustomGridView extends StatelessWidget {

  const CustomGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0, 
             childAspectRatio: 9/10,
              mainAxisSpacing: 20.0, // Space between rows
            ),
            itemCount: 20,
       itemBuilder:  (context , index){
        return const ListItem();
       });
  }
}
