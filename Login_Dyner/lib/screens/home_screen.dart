import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  static const name = 'HomeScreen';
  String userName;
  HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen', style: TextStyle(fontWeight: FontWeight.bold),),),
      body: Center(child: Text('¡Bienvenido $userName!', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
    );
  }
}
