import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../utils/fonts.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return  Padding(
     padding: const EdgeInsets.all(8.0),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: [ 
          Text(title,
          style: arabicstyle2,),      
       ],
     ),
            );
  }
}

