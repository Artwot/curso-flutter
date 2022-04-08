void main() {
  printError(NetworkError.badURL);
}

enum NetworkError {
  badURL,
  timeout,
  resourceNotAvailable,
}

void printError(NetworkError error) {
  switch (error) {
    case NetworkError.badURL:
      print('bad url');
      break;
    case NetworkError.timeout:
      print('timeout');
      break;
    case NetworkError.resourceNotAvailable:
      print('resource Not Available');
      break;
  }
}
