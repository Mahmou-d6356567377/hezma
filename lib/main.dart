import 'package:flutter/material.dart';
import 'package:hezma/utils/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,

    );
  }
}
