void main() {
  final values = [1, 2, 3, 4];
  print(sum(values));
}

int sum(List<int> values) {
  /* 
    Esta linea es parecida a lo que hace un for loop
    Un closure es una función sin un nombre, similar a una función anónima.
    actúa de forma parecida a un reduce en python
  */
  // Los parámetros que recive son: fold(valorInicial, función),
  return values.fold(0, (result, value) => result + value);
}
