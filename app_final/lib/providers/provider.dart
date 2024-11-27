import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_final/entities/alfajor.dart';

StateProvider<int> indexAlfajorSeleccionado = StateProvider((ref) => -1);

final alfajorProvider = StateNotifierProvider<AlfajorNotifier, List<Alfajor>>(
  (ref) => AlfajorNotifier(),
);

class AlfajorNotifier extends StateNotifier<List<Alfajor>> {
  AlfajorNotifier() : super([]);

  final db = FirebaseFirestore.instance;

  Future<void> obtenerDatos() async {
    try {
      final querySnapshot = await db.collection("alfajores").get();

      final listaAlfajores = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Alfajor(
          doc.id,
          data["nombre"] as String,
          data["marca"] as String,
          data["imagen"] as String,
        );
      }).toList();
      state = listaAlfajores;
    } catch (error) {
      print("Error al obtener datos: $error");
    }
  }

  Future<void> subirDatos(nombre, marca, imagen) async {
    try {
      await db
          .collection("alfajores")
          .add({"nombre": nombre, "marca": marca, "imagen": imagen});
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }

  Future<void> modificarDatos(id, nombre, marca, imagen) async {
    try {
      await db.collection("alfajores").doc(id).set(
        {"nombre": nombre, "marca": marca, "imagen": imagen},
      );
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }
}
