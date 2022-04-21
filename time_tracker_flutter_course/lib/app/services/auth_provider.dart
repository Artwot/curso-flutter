import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

/*
    1.Implementar el método
    2.Proveer acceso al objeto de tipo Auth
    3.Implementar el método .of(context)
    4.Agregar un widget child
    5.Usar en el árbol de widgets
  */

class AuthProvider extends InheritedWidget {
  AuthProvider({required this.auth, required this.child}) : super(child: child);
  final AuthBase auth;
  final Widget child;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  // static keyword define miembros/variables de una clase
  static AuthBase? of(BuildContext context) {
    AuthProvider? provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider?.auth;
  }
}
