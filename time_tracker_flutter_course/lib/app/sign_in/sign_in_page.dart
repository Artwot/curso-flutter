import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import 'sign_in_button.dart';
import 'email_sign_in_page.dart';
import 'social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  // Inicio de sesión de forma anónima
  Future<void> _signInAnonymously(BuildContext context) async {
    /*
      Usamos el patrón de diseño Singleton, el cual es usado en POO con la 
      finalidad de usar no más de una instancia de una clase. Además provee
      acceso global a los recursos
    */
    // Retorna un Future<UserCredencial>
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  // Inicio de sesión con Google
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  // Inicio de sesión con Facebook
  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  // Inicio de sesión con Email
  void _signInWithEmail(BuildContext context) {
    // Para navegar entre Widgets hacemos uso del widget Navigator, el cual funciona
    // como una pila, con los métodos push y pop.
    Navigator.of(context).push(
      // Crear una nueva ruta
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 4.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

// Se retorna un Widget, ya que Container hereda de Widget, así que no hay inconveniente.
// Para hacer MÉTODOS PRIVADOS se debe anteponer "_" al nombre del método, los
// cuales solo son accesibles dentro de la clase que lo contiene
  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      // Un child puede tener un Widget dentro de sí mismo.
      child: Column(
        // Para distribuir el contenido a lo largo del container.
        mainAxisAlignment: MainAxisAlignment.center,
        // Para ocupar todo el ancho del container.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 48.0),
          // Inicio de sesión con Google
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () => _signInWithGoogle(context),
          ),
          SizedBox(height: 8.0),
          // Inicio de sesión con Facebook
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () => _signInWithFacebook(context),
          ),
          SizedBox(height: 8.0),
          // Inicio de sesión con Email
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: (Colors.teal[700])!,
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          // Inicio de sesión de forma Anónima
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: (Colors.lime[300])!,
            // 'onPressed' es un callback, y no es necesario agregar (), pues no toma argumentos
            onPressed: () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }
}
