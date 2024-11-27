import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:app_final/entities/alfajor.dart';
import 'package:app_final/screens/details_screen.dart';
import 'package:app_final/providers/provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(alfajorProvider.notifier).obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    final List<Alfajor> listaAlfajor = ref.watch(alfajorProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaAlfajor.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(listaAlfajor[index].nombre),
                    subtitle: Text(listaAlfajor[index].marca),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(listaAlfajor[index].imagen),
                    ),
                    onTap: () {
                      ref.read(indexAlfajorSeleccionado.notifier).state = index;
                      context.pushNamed(DetailScreen.name);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(indexAlfajorSeleccionado.notifier).state = -1;
              context.pushNamed(DetailScreen.name);
            },
            child: const Icon(
              Icons.edit,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
