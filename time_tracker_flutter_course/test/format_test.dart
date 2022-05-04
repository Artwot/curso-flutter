import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import '../lib/app/home/job_entries/format.dart';

void main() {
  // Tests de horas
  group('hours', () {
    test('positive', () {
      expect(Format.hours(10), '10h');
    });

    test('zero', () {
      expect(Format.hours(0), '0h');
    });

    test('negative', () {
      expect(Format.hours(-5), '0h');
    });

    test('decimal', () {
      expect(Format.hours(4.5), '4.5h');
    });
  });

  // Tests de fechas
  group('date - GB Local', () {
    // El método setUp() se ejecuta antes de correr cada test
    setUp(() async {
      Intl.defaultLocale = 'en_GB';
      await initializeDateFormatting(Intl.defaultLocale!, '');
    });

    // NOTA: El formato de fecha depende del formato de fecha local del sistema
    // Localmente se necesita asignar el formato de fecha al escribir tests
    test('2019-08-12', () {
      expect(
        Format.date(DateTime(2019, 8, 12)),
        'Aug 12, 2019',
      );
    });

    test('2019-08-16', () {
      expect(
        Format.date(DateTime(2019, 8, 16)),
        'Aug 16, 2019',
      );
    });
  });

  // Tests dia de la semana
  group('dayOfWeek - GB Local', () {
    setUp(() async {
      Intl.defaultLocale = 'en_US';
      await initializeDateFormatting(Intl.defaultLocale!, '');
    });

    test('Friday', () {
      expect(
        Format.dayOfWeek(DateTime(2019, 8, 16)),
        'Fri',
      );
    });
  });

  group('dayOfWeek - IT Local', () {
    setUp(() async {
      // Intl.defaultLocale = 'it_IT';
      // await initializeDateFormatting('it_IT', '');
    });

    test('Monday', () {
      expect(
        Format.dayOfWeek(DateTime(2019, 8, 12)),
        'Mon',
      );
    });
  });

  // Currency
  group('currency - US locale', () {
    test('positive', () {
      expect(Format.currency(10), '\$10');
    });

    test('zero', () {
      expect(Format.currency(0), '');
    });

    test('negative', () {
      expect(Format.currency(-5), '-\$5');
    });
  });
}

/*
  Métodos del ciclo de vida de los Test
  > flutter test

  setUpAll

  setUp
  test1
  tearDown

  ...

  setUp
  testN
  tearDown

  tearDownAll
*/