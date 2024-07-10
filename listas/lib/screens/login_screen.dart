// ignore_for_file: must_be_immutable
import 'package:listas/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listas/entities/users.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  List<Users> usuarios = [
    Users('urieldyn@gmail.com', '1234'),
    Users('urieldyn2@gmail.com', '12345'),
    Users('urieldyn3@gmail.com', '123456'),
  ];

  var snackBar_1 = SnackBar(
      content: const Text("Usuario incorrecto"),
      action: SnackBarAction(
        label: 'Descartar',
        onPressed: () {},
      ));

  var snackBar_2 = SnackBar(
      content: const Text("Contraseña incorrecta"),
      action: SnackBarAction(
        label: 'Descartar',
        onPressed: () {},
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login: ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
            width: 600,
            child: TextField(
              controller: userController,
              decoration: const InputDecoration(
                  hintText: 'Email ', icon: Icon(Icons.email)),
            ),
          ),
          SizedBox(
            height: 100,
            width: 600,
            child: TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Password:', icon: Icon(Icons.key)),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                int x = usuarios.indexWhere((usuario) => usuario.user == userController.text);
                //indexWhere devuelve -1 si no encuentra
                if (x != -1){
                  if (usuarios[x].pass == passController.text) {
                    context.pushNamed(HomeScreen.name, extra: userController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar_2);
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar_1);
                }
              },
              child: const Text("Login")),
        ],
      ))),
    );
  }
}