import 'package:flutter/widgets.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/cart_item.dart';

class CustomListItemCart extends StatelessWidget {
  const CustomListItemCart({
    super.key, required this.itmcount,
  });
 final int itmcount ;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itmcount,
      itemBuilder:(context , index)=> const Padding(
        padding:  EdgeInsets.all(8.0),
        child:  CartItem(),
      ));
  }
}
