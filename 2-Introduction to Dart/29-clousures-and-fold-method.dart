void main() {
  final values = [1, 2, 3, 4];
  print(sum(values));
}

int sum(List<int> values) {
  // Esta linea es parecida a lo que hace un for loop
  // Un clousure es una funcion sin un nombre, parecida a la funcion anonima
  // fold(valorInicial, funcion), actua de forma parecida a un reduce en python
  return values.fold(0, (result, value) => result + value);
}
