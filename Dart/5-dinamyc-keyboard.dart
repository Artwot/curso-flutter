void main() {
  var name = 'Jorge Arturo';
  var age = 22;
  /* Las variables declaradas como "dynamic" son interpretadas como variables
  a las que se les puede asignar cualquier tipo de dato. */
  dynamic height = 1.75;
  height = "Jorge";

  print("Hello, I'm $name");
  print("My name has ${name.length} letters");
  print("I'm $age years old");
  print("I'm $height meters tall");
}
