void main() {
  printOddEvent(5);
  printOddEvent(6);
}

// Imprimir si un número dado es par o impar:
void printOddEvent(int value) {
  // El operador ternario permite reducir una expresión simple de if-else
  final type = (value % 2 == 0) ? 'even' : 'odd';
  print('$value is $type');
}
