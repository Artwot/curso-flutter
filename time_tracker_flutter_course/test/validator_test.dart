import 'package:flutter_test/flutter_test.dart';
import '../lib/app/sign_in/validators.dart';

void main() {
  // El objetivo de los test unitarios es probar todas las entradas posibles

  // Validar que el String no está vacío
  test('non empty string', () {
    final validator = NonEmptyStringValidator();
    expect(validator.isValid('test'), true);
  });

  //
  test('empty string', () {
    final validator = NonEmptyStringValidator();
    expect(validator.isValid(''), false);
  });

  // Este test no tiene razón de realizarse actualmente , ya que flutter implementó null safety
  // test('null string', () {
  //   final validator = NonEmptyStringValidator();
  //   expect(validator.isValid(null!), false);
  // });

  /* Metodología de Testing
    Escribir un test que falle ---> Escribir el código para hacer que el test pase
    ---> Hacer el código mas robusto con mas alcance en el test
  */
}
