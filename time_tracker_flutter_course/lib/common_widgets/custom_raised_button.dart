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
    required this.child,
    required this.color,
    this.borderRadius: 16.0,
    this.height: 50.0,
    required this.onPressed,
  });

  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color,
          onSurface: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed, // la propiedad 'onPressed' es opcional
      ),
    );
  }
}
