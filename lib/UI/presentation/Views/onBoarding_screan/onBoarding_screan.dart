import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/Intro_screans/pg1.dart';
import 'package:hezma/UI/presentation/Views/Intro_screans/pg2.dart';
import 'package:hezma/UI/presentation/Views/Intro_screans/pg3.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScrean extends StatefulWidget {
  const OnBoardingScrean({super.key});

  @override
  State<OnBoardingScrean> createState() => _OnBoardingScreanState();
}

class _OnBoardingScreanState extends State<OnBoardingScrean> {
   PageController pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( 
      children: [ 
 PageView(
  controller: pagecontroller,
       children: const [ 
         IntroPage1(),
         IntroPage2(),
         IntroPage3(),
       ],
    ),
    Container(
      alignment: const  Alignment(-0.9, 0.9),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Column( 
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Row(
               children: [
                 SmoothPageIndicator(controller: pagecontroller, count: 3),
                const  Spacer(),
                 GestureDetector(onTap: (){
                if(pagecontroller.page != 2)
                { pagecontroller.nextPage(duration: const Duration(milliseconds: 500)
                 , curve: Curves.easeInOut,
                 );
                 }else{
                  GoRouter.of(context).push(AppRoutes.rs);
                 }
                 }, child: Image.asset(kNextIcon ,
                 //color:const  Color(backgroundcustomgreen),
                 ),
                 ),
               ],
             ),
               Row(
               children: [
                

                GestureDetector(
                  onTap: (){
                   GoRouter.of(context).push(AppRoutes.rs);
                  },
                  child: const Padding(
                    padding:  EdgeInsets.only(bottom: 20, left: 10),
                    child:  Text('تخطى' ,style: TextStyle(color: Color(backgroundcolor1),),),
                  )),
               ],
             ),
           ],
         ),
       )
       ),

      
      ],
    ),
    );
  }
}