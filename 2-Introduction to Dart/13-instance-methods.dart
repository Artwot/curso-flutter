void main() {
  final person = Person(name: "Jorge", age: 22, height: 1.75);
  /*  
    Se puede acceder a los métodos de una clase a través del objeto. Un método
    hace referencia a una función dentro de una clase, por ende, son lo mismo.
  */
  print(person.describe());
}

class Person {
  Person({this.name = "", this.age = 0, this.height = 0.0});

  String name;
  int age;
  double height;

  String describe() =>
      "Hello, I'm $name. I'm $age years old. I'm $height meters tall";

  void sayName() => print("Hello, I'm $name");
}
