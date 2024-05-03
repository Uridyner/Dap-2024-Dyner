import 'package:ejemplo_flutter_app/core/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}
