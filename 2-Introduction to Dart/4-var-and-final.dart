void main() {
  // Las variables declaradas con "var" son mutables, es decir, cambian su valor.
  var name = 'Jorge Arturo';
  var age = 22;
  /* Las variables declaradas con "final" son inmutables, es decir, no se puede
  cambiar el valor con el que se inicializó */
  final height = 1.75;

  print("Hello, I'm $name");
  print("My name has ${name.length} letters");
  print("I'm $age years old");
  print("I'm $height meters tall");
}
