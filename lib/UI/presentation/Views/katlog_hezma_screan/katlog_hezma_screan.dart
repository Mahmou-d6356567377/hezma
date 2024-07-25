import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/katlog_hezma_screan/widgets/customGridViw1.dart';
import 'package:hezma/UI/presentation/Views/katlog_hezma_screan/widgets/navigation_button.dart';
import 'package:hezma/UI/presentation/Views/main_screan1/widgets/custom_list_view.dart';
import 'package:hezma/utils/fonts.dart';


class KatologHezmaScrean extends StatefulWidget {
  const KatologHezmaScrean({super.key});

  @override
  State<KatologHezmaScrean> createState() => _KatologHezmaScreanState();
}

class _KatologHezmaScreanState extends State<KatologHezmaScrean> {
  @override
  void initState() {
     isclicked3 = true;
    super.initState();
  }
  bool isclicked1 = false;
  bool isclicked2 = false;
  bool isclicked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios , color: Colors.black,)),
        centerTitle: true,
         title: const Text('كاتلوج حزمه',style: arabicstyle2,),
      ),

      body: Column(
        children: [ 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Expanded(
                   child: GestureDetector(
                    onTap: (){
                    setState(() {
                      isclicked1 = true;
                      isclicked2 = false;
                      isclicked3 = false;
                    });
                    },
                    child:  NavigationButton(title: 'مويه' , isClicked: isclicked1,)),
                 ),
              
                 Expanded(
                   child: GestureDetector(
                    onTap: (){
                     setState(() {
                      isclicked1 = false;
                      isclicked2 = true;
                      isclicked3 = false;
                     });
                    },
                    child:  NavigationButton(title: 'فواكه' , isClicked: isclicked2  ,)),
                 ),
              
                 Expanded(
                   child: GestureDetector(
                    onTap: (){      
                      setState(() {
                      isclicked1 = false;
                      isclicked2 = false;
                      isclicked3 = true;
                      });
                    },
                    child:  NavigationButton(title: 'خضار' , isClicked:  isclicked3,)),
                 ),
                ],
              ),
            ),
        const Expanded(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: customGridView1(),
        )),
        ],
      ),
    );
  }
}

