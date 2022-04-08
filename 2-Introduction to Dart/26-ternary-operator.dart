void main() {
  printOddEvent(5);
  printOddEvent(6);
}

// Imprimir si un numero dado es par o impa
void printOddEvent(int value) {
  // El operador ternario permite reducir una expresion simple de if-else
  final type = (value % 2 == 0) ? 'even' : 'odd';
  print('$value is $type');
}
