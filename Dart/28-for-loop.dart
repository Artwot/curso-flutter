void main() {
  final values = [1, 2, 3, 4];
  print(sum(values));
}

int sum(List<int> values) {
  int result = 0;
  for (int value in values) {
    result += value;
  }
  return result;
}
