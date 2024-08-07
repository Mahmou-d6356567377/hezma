import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/Intro_screans/pg1.dart';
import 'package:hezma/UI/presentation/Views/Intro_screans/pg2.dart';
import 'package:hezma/UI/presentation/Views/Intro_screans/pg3.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScrean extends StatefulWidget {
  const OnBoardingScrean({super.key});

  @override
  State<OnBoardingScrean> createState() => _OnBoardingScreanState();
}

class _OnBoardingScreanState extends State<OnBoardingScrean> {
   PageController pagecontroller = PageController();
  double value =1;

  
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
                    SmoothPageIndicator(
                  controller: pagecontroller, count: 3 ,
                    effect: const ExpandingDotsEffect(
                          dotWidth: 10.0,
                          dotHeight: 5.0,
                          paintStyle: PaintingStyle.fill,
                          activeDotColor: Color.fromARGB(255, 255, 255, 255),
                          ),
                          ),
                    const Spacer(),
                AnimatedBuilder(
                  animation: pagecontroller,
                 builder: (context, child){
                  value =(pagecontroller.hasClients &&
                   pagecontroller.page != null) ? ( pagecontroller.page! + 1)/3 :0 ;
                  return GestureDetector(
                  onTap: (){
                   if(pagecontroller.page != 2)
                  {
                     pagecontroller.nextPage(duration: const Duration(milliseconds: 500)
                   , curve: Curves.easeInOut,
                   );
                   }else{
                    GoRouter.of(context).push(AppRoutes.rs);
                   }
                  },
                   child: Stack(
                    alignment: Alignment.center,
                    children: [ 
                   SizedBox(
                        width: 50,
                        height: 50,
                     child: CircularProgressIndicator(
                      strokeWidth: 4,
                      backgroundColor: Colors.grey[300],
                      valueColor: const  AlwaysStoppedAnimation<Color>(Color(backgroundcustomgreen)),
                       value: value,
                    ),
                   ),
                   Container(
                    width: 38,
                    height: 38,
                    decoration: const  BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Transform.rotate(
                      angle: 0,
                      child: const Icon(
                       Icons.arrow_forward_ios,
                       color: Colors.green,
                       size: 25,
                     ),
                    ),
                   )
                   
                    ],
                   ),
                   );
                 }),
               ],
             ),
               Row(
               children: [
                

                GestureDetector(
                  onTap: (){
                   GoRouter.of(context).push(AppRoutes.rs);
                  },
                  child:  Padding(
                    padding: const  EdgeInsets.only(bottom: 20, left: 10),
                    child:  Text('تخطي' ,style: arabicstyle5.copyWith(fontSize: 15),
                    ),
                  )
                  ),
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