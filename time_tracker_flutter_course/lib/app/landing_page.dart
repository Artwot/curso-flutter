import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'services/auth.dart';
import 'sign_in/sign_in_page.dart';
import 'home_page.dart';

/* 
  La comunicación entre widgets se produce a través de los 'callbacks'
  Esta página actúa como la página 'root' de nuestra aplicación.

  LandingPage controla el state de Auth
*/

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            // Si el usuario no inició sesión, dirigirlo a SignInPage
            if (user == null) {
              return SignInPage(
                auth: auth,
              );
            }
            return HomePage(
              auth: auth,
            );
          }
          return Scaffold(
            body: Center(
              // Muestra un indicador de progreso durante la carga de datos
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
