

import 'package:flutter/cupertino.dart';
import 'package:hezma/UI/presentation/Views/katlog_hezma_screan/widgets/listItem1.dart';

class customGridView1 extends StatelessWidget {

  const customGridView1({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0, 
              childAspectRatio: 7/5,
              mainAxisSpacing: 20.0, // Space between rows
            ),
            itemCount: 20,
       itemBuilder:  (context , index){
        return const ListItem1();
       });
  }
}
