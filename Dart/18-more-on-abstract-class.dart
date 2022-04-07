import 'dart:math';

void main() {
  final square = Square(side: 10.0);
  print(square.area());

  final circle = Circle(radius: 5.0);
  print(circle.area());
}

abstract class Shape {
  double area();
}

class Square implements Shape {
  Square({this.side = 0});
  final double side;
  @override
  double area() => side * side;
}

class Circle implements Shape {
  Circle({this.radius = 0.0});
  final double radius;
  @override
  double area() => radius * radius * pi;
}
