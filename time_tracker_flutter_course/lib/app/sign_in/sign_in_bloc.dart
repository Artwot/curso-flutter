import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth.dart';

class SignInBloc {
  SignInBloc({required this.auth});
  final AuthBase auth;
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  // Tiene acceso al Stream pero no al controller
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  // De esta forma podemos cerrar nuestro Controller cuando SignInPage
  // es eliminada del 'Widget tree'
  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  // Podemos pasar funciones como argumentos a otras funciones
  Future<User?> _signIn(Future<User?> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      rethrow;
    } finally {
      _setIsLoading(false);
    }
  }

  Future<User?> signInAnonymously() async =>
      await _signIn(auth.signInAnonymously);

  Future<User?> signInWithGoogle() async =>
      await _signIn(auth.signInWithGoogle);

  Future<User?> signInWithFacebook() async =>
      await _signIn(auth.signInWithFacebook);
}
