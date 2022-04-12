import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

/* 
  1. Agregar Propiedades
  2. Agregar un Constructor
  3. Usar Propiedades

  Todas las propiedades dentro de un Stateless Widget deben ser inmutables, de 
  tipo "final"
*/
class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius: 16.0,
    this.height: 50.0,
    this.onPressed,
    // Los assertions son muy útiles al momento de verificar errores de programación
    // durante el runtime, es preferible usarlos solo en modo debug
  }) : assert(borderRadius != null);
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        onPressed: onPressed, // la propiedad 'onPressed' es opcional
      ),
    );
  }
}
