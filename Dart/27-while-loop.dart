void main() {
  final values = [1, 2, 3, 4];
  print(sum(values));
}

int sum(List<int> values) {
  int i = 0;
  int result = 0;
  while (i < values.length) {
    result += values[i];
    i++;
  }
  return result;
}
