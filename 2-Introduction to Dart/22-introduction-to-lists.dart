// Una lista es un grupo ordenado de objetos
void main() {
  // Definir lista
  var primeNumbers = [2, 3, 5, 7];
  // Iterables es una clase abstracta, una coleccion de valores que puede ser
  // accesada secuencialmente. Las listas implementan de Iterable.
  primeNumbers.addAll([11, 13, 17, 19]); // Agregar varios valores a una list
  primeNumbers.add(23); // Agregar un unico valor a una lista.
  print(primeNumbers);
}
