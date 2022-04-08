/*  
  Dart proporciona dos tipos de parámetros: posicionales, y con nombre; ambos
  son mutuamente exclusivos. 
*/

void main() {
  var name = 'Jorge Arturo';
  var age = 22;
  var height = 1.75;

  /*  
    Al invocar las funciones se debe ingresar el nombre del parámetro seguido 
    por dos puntos : y el valor 
  */
  final person1 = describe(name: name, age: age, height: height);
  final person2 = describe(name: "Leonardo da Vinci", age: 27, height: 1.83);

  print(person1);
  print(person2);
}

/* 2. Parámetros con nombre: Para definir estos parámetros en la función, es 
      necesario envolverlos entre llaves {}
      (En versiones recientes de Dart, es necesario asignarles un valor por 
      defecto, en caso contrario, se asignará "null" y generará un error).

      Los parámetros con nombre generan un código más verboso pero más claro 
      para leer, por lo cual es recomendable usarlos. 
 */
String describe({String name = "", int age = 0, double height = 0.0}) {
  return "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
}
