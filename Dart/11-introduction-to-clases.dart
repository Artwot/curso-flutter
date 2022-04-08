/*  
    Clase: Una clase es un modelo personalizado que contiene variables y 
    funciones con un comportamiento particular, el cual es dado por la lógica de
    la clase.
*/

void main() {
  /*  
    Crear una instancia de la clase Person. Una instancia de una clase es 
    básicamente la creación de un objeto derivado de la misma.
  */
  final person = Person();
}

// Definir una clase llamada Person
class Person {
  String name = "";
  int age = 0;
  double height = 0.0;
}

String describe({String name = "", int age = 0, double height = 0.0}) {
  return "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
}

String describe2({String name = "", int age = 0, double height = 0.0}) =>
    "Hello, I'm $name. I'm $age years old. I'm $height meters tall";

void sayName(String name) => print("Hello, I'm $name");
