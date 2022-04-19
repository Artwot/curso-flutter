abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    // Verifica que el valor no esté vacío
    return value.isNotEmpty;
  }
}
