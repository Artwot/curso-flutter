import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/app/services/auth.dart';
import '/app/services/database.dart';
import '/app/sign_in/sign_in_page.dart';

import 'home/home_page.dart';

/* 
  La comunicación entre widgets se produce a través de los 'callbacks'
  Esta página actúa como la página 'root' de nuestra aplicación.

  El estado es controlado por AuthProvider
*/

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key, required this.databaseBuilder})
      : super(key: key);
  final Database Function(String) databaseBuilder;

  @override
  Widget build(BuildContext context) {
    // Usar listen: 'true' cuando estamos en un 'state' que puede cambiar y el
    // widget actual debería re renderizarse como resultado
    // User listen: 'false' cuando los objetos no cambian (e.g. Auth class)
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          // Si el usuario no inició sesión, dirigirlo a SignInPage
          if (user == null) {
            return SignInPage.create(context);
          }
          return Provider<Database>(
            create: (_) => databaseBuilder(user.uid),
            child: HomePage(),
          );
        }
        return Scaffold(
          body: Center(
            // Muestra un indicador de progreso durante la carga de datos
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
