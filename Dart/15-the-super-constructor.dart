void main() {
  final employee = Employee(
      name: "Jorge", age: 22, height: 1.75, taxCode: 'AB12', salary: 50000);
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

class Employee extends Person {
  /*  Para acceder a las varaibles de la clase padre Person, estas deben ser 
      requeridas en el constructor de la subclase, posteriormente, hay que invocar
      al método super() y pasar dichos parámetros.
  */
  Employee(
      {String name = "",
      int age = 0,
      double height = 0.0,
      this.taxCode = "",
      this.salary = 0})
      : super(name: name, age: age, height: height);
  final String taxCode;
  final int salary;
}
