// Las clases abstractas definen algunos metodos y propiedades sin
// especificar como son implementados, nos ayudan a definir interfaces

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
