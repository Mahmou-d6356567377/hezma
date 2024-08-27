import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/cart_item.dart';

class CustomListItemCart extends StatefulWidget {
  const CustomListItemCart({
    super.key,
  });

  @override
  State<CustomListItemCart> createState() => _CustomListItemCartState();
}

class _CustomListItemCartState extends State<CustomListItemCart> {
  @override
  Widget build(BuildContext context) {
    List<int> cartItems = [1, 2, 3, 4];
    return Column(
      children: cartItems.map((id) {
        return Slidable(
          key: Key(id.toString()),
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                setState(() {
                  cartItems.remove(id);
                });
              },
            ),
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                icon: Icons.delete,
                label: 'حذف',
              ),
            ],
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: const CartItem(),
          ),
        );
      }).toList(),
    );
  }
}
