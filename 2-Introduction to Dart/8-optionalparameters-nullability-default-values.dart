void main() {
  var name = 'Jorge Arturo';
  var age = 22;
  var height = 1.75;

  final person1 = describe(
    name,
    age,
  ); // Se puede omitir el parámetro "height" al ser un parámetro opcional.
  final person2 = describe("Leonardo da Vinci", 27, 1.83);

  print(person1);
  print(person2);
}

/* 1. Parámetros opcionales: Se declara dentro de los parámetros de la función
      entre corchetes [] y se le asigna un valor por defecto, para evitar que
      que se asigne null a la variable. */
String describe(String name, int age, [double height = 0.0]) {
  return "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
}
