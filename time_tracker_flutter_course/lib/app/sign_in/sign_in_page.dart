import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/show_exception_alert_dialog.dart';
import '../services/auth.dart';
import 'sign_in_bloc.dart';
import 'sign_in_button.dart';
import 'email_sign_in_page.dart';
import 'social_sign_in_button.dart';

class SignInPage extends StatefulWidget {
  // Usar el método 'static create(context)' cuando se crean widgets que requieren un BLoC
  static Widget create(BuildContext context) {
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(),
      child: SignInPage(),
    );
  }

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  // Inicio de sesión de forma anónima
  Future<void> _signInAnonymously(BuildContext context) async {
    /*
      Usamos el patrón de diseño Singleton, el cual es usado en POO con la 
      finalidad de usar no más de una instancia de una clase. Además provee
      acceso global a los recursos
    */
    // Retorna un Future<UserCredencial>
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Inicio de sesión con Google
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Inicio de sesión con Facebook
  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Inicio de sesión con Email
  void _signInWithEmail(BuildContext context) {
    print('Click here...');
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
          SizedBox(
            height: 50.0,
            child: _buildHeader(),
          ),
          SizedBox(height: 48.0),
          // Inicio de sesión con Google
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _isLoading ? null : () => _signInWithGoogle(context),
          ),
          SizedBox(height: 8.0),
          // Inicio de sesión con Facebook
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: _isLoading ? null : () => _signInWithFacebook(context),
          ),
          SizedBox(height: 8.0),
          // Inicio de sesión con Email
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: (Colors.teal[700])!,
            onPressed: _isLoading ? null : () => _signInWithEmail(context),
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
            onPressed: _isLoading ? null : () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
