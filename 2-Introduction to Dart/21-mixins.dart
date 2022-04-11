// Los mixin extraen y reutilizan una funcionalidad en multiples clases

// Mixin extiende la funcionalidad de clases existentes
mixin BMI {
  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }
}

// Agregar mixin BMI
class Person with BMI {
  Person({this.name = "", this.age = 0, this.height = 0.0, this.weight = 0.0});
  final String name;
  final int age;
  final double height;
  final double weight;

// Forma de llamar a un mixin
  double get bmi => calculateBMI(weight, height);
}

void main() {
  final person = Person(name: "Jorge", age: 24, height: 1.84, weight: 70);
  print(person.bmi);
}
