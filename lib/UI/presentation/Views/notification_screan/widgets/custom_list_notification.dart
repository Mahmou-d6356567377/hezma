

import 'package:flutter/widgets.dart';

import 'notification_item.dart';

class CustomListNotification extends StatelessWidget {
  const CustomListNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context , index){
        return const  NotificationIcon();
      });
  }
}

