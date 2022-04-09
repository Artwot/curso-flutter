void main() {
  final employee = Employee(
      name: "Jorge", age: 22, height: 1.75, taxCode: 'AB12', salary: 50000);
  employee.sayName();
  print(employee.toString());
}

class Person {
  Person({this.name = "", this.age = 0, this.height = 0.0});

  final String name;
  final int age;
  final double height;

  // Este método sobrescribe el método toString() de la superclase Object, por
  // ende, hay que usar la anotación @override
  @override
  String toString() => 'name: $name, age: $age, height: $height';

  String describe() =>
      "Hello, I'm $name. I'm $age years old. I'm $height meters tall";

  void sayName() => print("Hello, I'm $name");
}

class Employee extends Person {
  Employee(
      {String name = "",
      int age = 0,
      double height = 0.0,
      this.taxCode = "",
      this.salary = 0})
      : super(name: name, age: age, height: height);

  final String taxCode;
  final int salary;

  @override
  String toString() =>
      "${super.toString()}, taxCode: $taxCode, salary: $salary";
}

// RECOMENDACIÓN: Al hacer un proceso de debug, podemos hacer uso del método
// toString() para ver lo que retorna nuestra clase.
