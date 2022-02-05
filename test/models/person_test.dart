import 'package:flutter_test/flutter_test.dart';
import 'package:unity_tests_study/models/person.dart';

void main() {
  final person = Person(
    id: '0',
    name: 'Jadiel Santana',
    age: 25,
    height: 1.83,
    weight: 87.6,
  );

  test('O IMC deve retornar 26.16', () {
    expect(person.imc, 26.16);
  });

  group('isOlder() | ', () {
    test('Se a idade for maior que 18, então isOlder deve ser true', () {
      expect(person.isOlder, true);
    });

    test('Se a idade for igual a 18, então isOlder deve ser true', () {
      final person = Person(
        id: '1',
        name: 'Jadiel Santana',
        age: 18,
        height: 1.83,
        weight: 87.6,
      );
      expect(person.isOlder, true);
    });

    test('Se a idade for < 18, então isOlder deve ser false', () {
      final person = Person(
        id: '2',
        name: 'Jadiel Santana',
        age: 17,
        height: 1.83,
        weight: 87.6,
      );
      expect(person.isOlder, false);
    });
  });
}