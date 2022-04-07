void main() {
  var primeNumbers = List<int>(); // []
  primeNumbers.addAll([2, 3, 5, 7]);
  var person = <String, dynamic>{
    'name': 'Jorge',
    'age': 34,
    'height': 1.84,
  };

  // Agregar una key
  person['weight'] = 70;
  print(person['weight']);
}
