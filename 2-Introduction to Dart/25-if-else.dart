void main() {
  printOddEvent(4);
}

void printOddEvent(int value) {
  if (value % 2 == 0) {
    print('$value is even');
  } else {
    print('$value is odd');
  }
}
