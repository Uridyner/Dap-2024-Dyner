// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_final/providers/provider.dart';
import 'package:app_final/entities/alfajor.dart';
import 'package:app_final/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends ConsumerWidget {
  static const String name = 'detalles';
  DetailScreen({super.key});
  TextEditingController nombreAlfajorController = TextEditingController();
  TextEditingController marcaAlfajorController = TextEditingController();
  TextEditingController imagenAlfajorController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, ref) {
    final List<Alfajor> listaAlfajor = ref.watch(alfajorProvider);
    final index = ref.watch(indexAlfajorSeleccionado);

    bool modoAgregar;
    if (index != -1) {
      nombreAlfajorController.text = listaAlfajor[index].nombre;
      marcaAlfajorController.text = listaAlfajor[index].marca;
      imagenAlfajorController.text = listaAlfajor[index].imagen;
      modoAgregar = false;
    } else {
      modoAgregar = true;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: nombreAlfajorController,
                decoration: const InputDecoration(
                  hintText: "Nombre del alfajor",
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: marcaAlfajorController,
                decoration: const InputDecoration(
                  hintText: "Marca del alfajor",
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 350,
              child: TextField(
                controller: imagenAlfajorController,
                decoration: const InputDecoration(
                  hintText: "poner el link de la imagen del alfajor",
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (modoAgregar) {
                  ref.read(alfajorProvider.notifier).subirDatos(
                      nombreAlfajorController.text,
                      marcaAlfajorController.text,
                      imagenAlfajorController.text);
                } else {
                  ref.read(alfajorProvider.notifier).modificarDatos(
                      listaAlfajor[index].id,
                      nombreAlfajorController.text,
                      marcaAlfajorController.text,
                      imagenAlfajorController.text);
                }
                context.pushNamed(HomeScreen.name);
              },
              child: Text(
                modoAgregar ? "Agregar" : "Modificar",
              ),
            ),
            const SizedBox(height: 10),
            if (!modoAgregar)
              ElevatedButton(
                onPressed: () {
                  db.collection("alfajores").doc(listaAlfajor[index].id).delete();
                  context.pushNamed(HomeScreen.name);
                },
                child: const Text(
                  "Eliminar",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
