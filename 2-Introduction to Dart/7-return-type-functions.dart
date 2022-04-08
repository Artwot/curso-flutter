void main() {
  var name = 'Jorge Arturo';
  var age = 22;
  dynamic height = 1.75;

  // El valor de retorno de la función se asigna a una variable
  final person1 = describe(name, age, height);
  final person2 = describe("Leonardo da Vinci", 27, 1.83);

  // Imprimir los valores
  print(person1);
  print(person2);
}

/* Se escribe el tipo de dato que retornará la función, en este caso, "String" y
   el valor de retorno con la palabra "return" */
String describe(String name, int age, double height) {
  return "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
}
