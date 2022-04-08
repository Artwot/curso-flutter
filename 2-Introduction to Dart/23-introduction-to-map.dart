// "Maps" son una colección de datos usada principalmente para representar datos
// en formato JSON

void main() {
  // Definir un map
  var person = {
    'name': 'Jorge',
    'age': 34,
    'height': 1.84,
  };

  // Agregar una key
  person['weight'] = 70;
  print(person['weight']);
}
