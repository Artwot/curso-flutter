import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sign_in_manager.dart';
import 'sign_in_button.dart';
import 'email_sign_in_page.dart';
import 'social_sign_in_button.dart';
import '/common_widgets/show_exception_alert_dialog.dart';
import '../services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
    required this.manager,
    required this.isLoading,
  }) : super(key: key);
  final SignInManager? manager;
  final bool isLoading;

  static const Key emailPasswordKey = Key('email-password');

  // Usar el método 'static create(context)' cuando se crean widgets que requieren un BLoC
  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      // Usar el widget Consumer nos permite llamar el valor cada vez que este
      // cambia en la propiedad build
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (_, manager, __) =>
                SignInPage(manager: manager, isLoading: isLoading.value),
          ),
        ),
      ),
    );
  }

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
      await manager?.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  // Inicio de sesión con Google
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager?.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  // Inicio de sesión con Facebook
  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await manager?.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
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
            onPressed: isLoading ? null : () => _signInWithGoogle(context),
          ),
          SizedBox(height: 8.0),
          // Inicio de sesión con Facebook
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: isLoading ? null : () => _signInWithFacebook(context),
          ),
          SizedBox(height: 8.0),
          // Inicio de sesión con Email
          SignInButton(
            key: emailPasswordKey,
            text: 'Sign in with email',
            textColor: Colors.white,
            color: (Colors.teal[700])!,
            onPressed: isLoading ? null : () => _signInWithEmail(context),
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
            onPressed: isLoading ? null : () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (isLoading) {
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
