/*  
  La Herencia es la relación que existe entre una clase base o "clase padre"
  y una clase que derive de esta, llamada "subclase" y que hereda las variables
  y métodos de la primera.
*/

void main() {
  final person = Person(name: "Jorge", age: 22, height: 1.75);
  print(person.describe());
  // Instanciar la clase Employee
  final employee = Employee(taxCode: 'AB12', salary: 50000);
  // Al heredar employee de la clase Person, este objeto puede acceder a los
  // métodos de la clase padre
  employee.sayName();
}

class Person {
  Person({this.name = "", this.age = 0, this.height = 0.0});

  final String name;
  final int age;
  final double height;

  String describe() =>
      "Hello, I'm $name. I'm $age years old. I'm $height meters tall";

  void sayName() => print("Hello, I'm $name");
}

// Crear una clase Employee que herede de la clase Person
class Employee extends Person {
  Employee({this.taxCode = "", this.salary = 0});
  final String taxCode;
  final int salary;
}
