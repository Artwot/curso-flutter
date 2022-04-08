/*  
  Las clases abstractas nos ayudan a programar las interfaces, no las 
  implementaciones.
*/

import 'dart:math';

void main() {
  final square = Square(side: 10.0);
  printArea(square);

  final circle = Circle(radius: 5.0);
  printArea(circle);
}

void printArea(Shape shape) {
  print(shape.area());
}

abstract class Shape {
  double area();
}

// Clase Square
class Square implements Shape {
  Square({this.side = 0});
  final double side;
  @override
  double area() => side * side;
}

// Clase Circle
class Circle implements Shape {
  Circle({this.radius = 0.0});
  final double radius;
  @override
  double area() => radius * radius * pi;
}
