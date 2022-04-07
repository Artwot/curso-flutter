// Declarar diferentes tipos de variables, String, int, double; inicializarlas
// con un valor e imprimirlas.
void main() {
  // Los tipos de variables definidas con la palabra reservada "var" infieren
  // el tipo de dato de acuerdo con el valor que se les asigna al inicializarlas
  var name = 'Jorge Arturo'; // String name = 'Jorge Arturo';
  var age = 22; // int age = 22;
  var height = 1.75; // double height = 1.75;

  print("Hello, I'm $name");
  print("My name has ${name.length} letters");

  print("I'm $age years old");
  print("I'm $height meters tall");
}
