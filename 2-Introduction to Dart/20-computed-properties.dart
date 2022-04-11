/*
  Son una característica de Dart en la que el valor de las propiedades es 
  procesado en el store: utilizan getters y setters.
*/

import 'dart:math';

void main() {
  final square = Square(side: 10.0);
  printArea(square);

  final circle = Circle(radius: 5.0);
  printArea(circle);
}

void printArea(Shape shape) {
  print(shape.area);
}

// Clase abstracta con computed property
abstract class Shape {
  double get area;
}

// Clase Square
class Square implements Shape {
  Square({this.side = 0});
  final double side;
  @override
  double get area => side * side;
}

// Clase Circle
class Circle implements Shape {
  Circle({this.radius = 0.0});
  final double radius;
  @override
  double get area => radius * radius * pi;
}
