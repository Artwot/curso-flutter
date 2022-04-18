import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/services/auth.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'home_page.dart';

/* 
  La comunicación entre widgets se produce a través de los 'callbacks'
  Esta página actúa como la página 'root' de nuestra aplicación.

  LandingPage controla el state de Auth
*/

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  // Para recuperar el usuario actual cuando la aplicación inicia se
  // implementa el método initState() para almacenar la sesión como
  // variable de estado al iniciar la app
  @override
  void initState() {
    super.initState();
    // Como 'auth' es declarado en la clase LandingPage, es necesario anteponer
    // 'widget.' para que reconozca la variable.
    _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User? user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Si el usuario no inició sesión, dirigirlo a SignInPage
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        // Se envía el usuario
        onSignIn: _updateUser,
      );
    }
    return HomePage(
      auth: widget.auth,
      // Se asigna un 'null' ya que no retorna un valor al finalizar sesión
      onSignOut: () => _updateUser(null),
    );
  }
}
