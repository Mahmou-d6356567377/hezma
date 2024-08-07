

import 'package:flutter/cupertino.dart';
import 'package:hezma/UI/presentation/Views/main_screan1/widgets/listItem.dart';

class CustomGridView2 extends StatelessWidget {

  const CustomGridView2({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0, 
              //childAspectRatio: 3/5,
              mainAxisSpacing: 20.0, 
            ),
            itemCount: 20,
       itemBuilder:  (context , index){
        return const ListItem();
       });
  }
}
