import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> signInAnonymously();
  Future<void> signOut();
}

// Dependency Injection
class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  // Crear un Stream
  // Notifica cambios en el estado de la sesión del usuario
  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
