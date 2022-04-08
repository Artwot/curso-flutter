// Las clases abstractas definen algunos métodos y propiedades sin necesidad
// de especificar cómo son implementados, y nos ayudan a definir interfaces.

void main() {
  final square = Square(side: 10.0);
  print(square.area());
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
