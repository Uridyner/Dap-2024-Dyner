import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_final/screens/home_screen.dart';
import 'package:app_final/screens/register_screen.dart';

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

class _LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool textoOculto = true;
  bool textoCubierto = false;

  String mensajeError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Logueate: ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Email ',
                  icon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(
              height: 65,
              width: 350,
              child: TextField(
                controller: passController,
                obscureText: textoOculto,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  icon: const Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon(
                      textoOculto ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        textoOculto = !textoOculto;
                      });
                    },
                  ),
                ),
              ),
            ),
            if (mensajeError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                setState(() {
                  mensajeError = '';
                });
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: userController.text,
                    password: passController.text,
                  );
                  context.pushNamed(HomeScreen.name);
                } on FirebaseAuthException catch (e) {
                  setState(() {
                    if (e.code == 'channel-error') {
                      mensajeError = 'Complete email y contraseña';
                    } else if (e.code == 'invalid-credential') {
                      mensajeError = 'Usuario o contraseña incorrecto';
                    } else if (e.code == 'missing-password') {
                      mensajeError = 'Poner contraseña';
                    } else if (e.code == 'invalid-email') {
                      mensajeError = 'Email inválido';
                    } else if (e.code == 'too-many-requests') {
                      mensajeError =
                          'Se intentó iniciar sesión muchas veces, intente más tarde.';
                    } else {
                      mensajeError = 'Error desconocido: ${e.code}';
                    }
                  });
                }
              },
              child: const Text("Login"),
            ),
            const SizedBox(
              height: 20,
            ),
            MouseRegion(
              onEnter: (_) => setState(() => textoCubierto = true),
              onExit: (_) => setState(() => textoCubierto = false),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(RegisterScreen.name);
                },
                onTapDown: (_) {
                  setState(() {
                    textoCubierto = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    textoCubierto = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    textoCubierto = false;
                  });
                },
                child: Text(
                  "No tenés cuenta? Registrate",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: textoCubierto
                        ? const Color.fromARGB(178, 19, 75, 226)
                        : const Color.fromARGB(255, 29, 163, 253),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
