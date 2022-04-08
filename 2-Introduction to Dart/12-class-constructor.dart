void main() {
  // Se instancia la clase y se envían los parámetros con nombre para asignarlos
  // a las variables del objeto a través del constructor de la clase.
  final person = Person(name: "Jorge", age: 22, height: 1.75);
  print(person.name);
}

class Person {
  /*  
    Si las variables declaradas no son inicializadas, se debe crear el método
    constructor.
  */
  Person({this.name = "", this.age = 0, this.height = 0.0});
  String name;
  int age;
  double height;
}

String describe({String name = "", int age = 0, double height = 0.0}) {
  return "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
}

String describe2({String name = "", int age = 0, double height = 0.0}) =>
    "Hello, I'm $name. I'm $age years old. I'm $height meters tall";

void sayName(String name) => print("Hello, I'm $name");
