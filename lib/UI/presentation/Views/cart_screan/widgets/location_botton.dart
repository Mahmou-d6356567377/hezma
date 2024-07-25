import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/utils/routes.dart';

import '../../../../../utils/constants.dart';

class LocatoinBotton extends StatelessWidget {
  const LocatoinBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).push(AppRoutes.mps);
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const  Color(darkwhite),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.max,
            children: [ 
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.location_on, color: Color(backgroundcustomgreen2),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

