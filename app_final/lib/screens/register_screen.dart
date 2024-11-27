import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_final/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String name = 'register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController userController2 = TextEditingController();
  TextEditingController passController2 = TextEditingController();
  String mensajeError = '';
  bool textoOculto1 = true;
  bool textoOculto2 = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Registrate: ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Email',
                icon: Icon(Icons.email),
              ),
            ),
          ),
          SizedBox(
            height: 75,
            width: 350,
            child: TextField(
              controller: userController2,
              decoration: const InputDecoration(
                hintText: 'Confirmar email',
                icon: Icon(Icons.email),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: TextField(
              controller: passController,
              obscureText: textoOculto1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                icon: const Icon(Icons.key),
                suffixIcon: IconButton(
                  icon: Icon(
                    textoOculto1 ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      textoOculto1 = !textoOculto1;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 65,
            width: 350,
            child: TextField(
              controller: passController2,
              obscureText: textoOculto2,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Confirmar contraseña',
                icon: const Icon(Icons.key),
                suffixIcon: IconButton(
                  icon: Icon(
                    textoOculto2 ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      textoOculto2 = !textoOculto2;
                    });
                  },
                ),
              ),
            ),
          ),
          if (mensajeError.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                mensajeError,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () async {
              setState(() {
                mensajeError = '';
              });
              if (passController.text.isEmpty ||
                  passController2.text.isEmpty ||
                  userController.text.isEmpty ||
                  userController2.text.isEmpty) {
                setState(() {
                  mensajeError = 'Por favor, completar los datos';
                });
                return;
              }

              if (passController.text != passController2.text) {
                setState(() {
                  mensajeError = 'Las contraseñas no coinciden';
                });
                return;
              }
              if (userController.text != userController2.text) {
                setState(() {
                  mensajeError = 'Los emails no coinciden';
                });
                return;
              }

              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: userController.text,
                  password: passController.text,
                );
                context.goNamed(LoginScreen.name);
              } on FirebaseAuthException catch (e) {
                setState(() {
                  if (e.code == 'weak-password') {
                    mensajeError = 'La contraseña es demasiado débil';
                  } else if (e.code == 'email-already-in-use') {
                    mensajeError = 'El email ya está en uso';
                  } else if (e.code == 'invalid-email') {
                    mensajeError = 'El email es inválido';
                  } else {
                    mensajeError = 'Error desconocido: ${e.code}';
                  }
                });
              }
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}
