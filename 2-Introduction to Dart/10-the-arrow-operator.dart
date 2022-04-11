void main() {
  var name = 'Jorge Arturo';
  var age = 22;
  var height = 1.75;

  final person1 = describe2(name: name, age: age, height: height);
  final person2 = describe2(name: "Leonardo da Vinci", age: 27, height: 1.83);

  print(person1);
  print(person2);

  sayName("Arturo");
}

String describe({String name = "", int age = 0, double height = 0.0}) {
  return "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
}

/*  
  El operador flecha o arrow operator es conocido como azúcar sintáctica, el 
  cual nos permite escribir código más conciso y limpio.

  En la función describe2() se eliminan las llaves {}, se agrega el operador 
  flecha => y se elimina la palabra "return", pues el retorno del valor ya 
  está implícito.
*/
String describe2({String name = "", int age = 0, double height = 0.0}) =>
    "Hello, I'm $name. I'm $age years old. I'm $height meters tall";

// También funciona para funciones de tipo "void"
void sayName(String name) => print("Hello, I'm $name");
