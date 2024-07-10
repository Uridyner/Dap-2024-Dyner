// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const String name = 'detalles';
  dynamic Jugador;
  DetailScreen({super.key, this.Jugador = 0});
  
  @override
  Widget build(BuildContext context) {
    var x = Jugador.Jugador;
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 500, height: 500, child: Image.network(Jugador.imagen)),
          Text(
            "Nombre: $x",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            Jugador.Numero,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}