import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'services/auth_provider.dart';
import 'sign_in/sign_in_page.dart';
import 'home_page.dart';

/* 
  La comunicación entre widgets se produce a través de los 'callbacks'
  Esta página actúa como la página 'root' de nuestra aplicación.

  LandingPage controla el state de Auth
*/

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return StreamBuilder<User?>(
        stream: auth?.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            // Si el usuario no inició sesión, dirigirlo a SignInPage
            if (user == null) {
              return SignInPage();
            }
            return HomePage();
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
