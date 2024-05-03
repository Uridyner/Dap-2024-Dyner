import 'package:ejemplo_flutter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const name = 'LoginScreen';
  LoginScreen({super.key});

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String user = 'Dyner';
  String pass = 'omatopopih';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(hintText: 'Usuario', icon: Icon(Icons.person)),
            ),
            const SizedBox(height: 40,),
            TextField(
              controller: passController,
              decoration: const InputDecoration(hintText: 'Contraseña', icon: Icon(Icons.lock),),
              obscureText: true,
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: (){
                String inputUser = userController.text;
                String inputPass = passController.text;

                if(inputUser == user && inputPass == pass){
                  context.pushNamed(HomeScreen.name, extra: userController.text);
                }
                else if(userController.text != user || passController.text != pass){
                  
                }
              }, 
              child: const Text('Login')
            )
          ],
        ),
      )
    );
  }
}