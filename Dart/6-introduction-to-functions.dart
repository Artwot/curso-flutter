void main() {
  var name = 'Jorge Arturo';
  var age = 22;
  dynamic height = 1.75;
  // Se invoca a la función describe()
  describe(name, age, height);
  // Invocar la función describe() con diferentes argumentos
  describe("Leonardo da Vinci", 27, 1.83);
}

/* Definir una función llamada "describe" que recibe tres parámetros: name,
    age, y height. Este tipo de función es de tipo "void", lo cual significa
    que no retorna ningún valor. */
void describe(String name, int age, double height) {
  print("Hello, I'm $name");
  print("I'm $age years old");
  print("I'm $height meters tall");
}
