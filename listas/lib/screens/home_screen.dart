// ignore_for_file: must_be_immutable
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:listas/entities/Jugadores.dart';
import 'package:listas/screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  HomeScreen({super.key});

  List<Argentina> jugadores = [
    Argentina('Messi', '10', 'https://media.admagazine.com/photos/637d11a6e63c8afac40e7a01/1:1/w_2896,h_2896,c_limit/1442809583'),
    Argentina('Dibu', '23', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz95VSh6-TbcAdixspHdAKwI9KY9eRT-yPEQ&s'),
    Argentina('De Paul', '7', 'https://resizer.glanacion.com/resizer/v2/el-baile-que-protagonizo-rodrigo-de-paul-junto-a-GUBEIUNUPJBFZO7YXKQN7MZPSE.png?auth=55a5f5a3d5418236e76009ec7332a46349b526c42024a0883fdedef0108408f3&width=880&height=586&quality=70&smart=true'),
    Argentina('Cuti Romero', '13', '2wCEAAkGBxMTEhUSEhIVFRUWFRUVFRUVFRUVFRUPFRUWFhUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGy0eHyUtLS0tLS0tLS0tLTctLi0tKzUtLS0tLS0tLS0tLS0tLS0tLi4tLSs1NS0tLS0tLS0tLf'),
    Argentina('mac allister', '20', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHywaReWTbOtl_iFWq3aJrtaLa_z3EGzYo6g&s'),
    Argentina('Lisandro Martinez', '25', '2wCEAAkGBxMTEhUTEhIVFRUVFRYVFxYVFRUVFRUVFRUWFxYXFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGy0lHyAtLy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Jugadores de Argentina'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(jugadores[index].Jugador),
              subtitle: Text(jugadores[index].Numero),
              leading: SizedBox(width: 50, height: 50, child: Image.network(jugadores[index].imagen)),
              onTap: (){
                context.pushNamed(DetailScreen.name, extra: jugadores[index]);
              }
            ),
          );
        },
      ),
    );
  }
}
