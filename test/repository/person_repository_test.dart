import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unity_tests_study/repository/person_repository.dart';

class ClientMock extends Mock implements Client {}

void main() {
  late ClientMock _client;
  late PersonRepository _repository;

  setUp(() {
    _client = ClientMock();
    _repository = PersonRepository(_client);
  });

  final url = Uri.parse(
    'https://61febcf8a58a4e00173c99a3.mockapi.io/api/v1/person/person',
  );

  test('Deve retornar uma List<Person>', () async {
    when(() => _client.get(url)).thenAnswer(
      (_) async => Response(jsonMock, 200),
    );
    final list = await _repository.getPerson();
    expect(list.isNotEmpty, equals(true));
    expect(list.first.name, equals('name 1'));
  });

  test('Deve retornar uma Exception se o StatusCode != 200', () async {
    when(() => _client.get(url)).thenAnswer(
      (_) async => Response(jsonMock, 404),
    );

    expect(() async => await _repository.getPerson(), throwsException);

  });
}

const jsonMock =
    '[{"name":"name 1","age":22,"height":2,"weight":58,"id":"1"},{"name":"name 2","age":95,"height":70,"weight":25,"id":"2"},{"name":"name 3","age":95,"height":85,"weight":59,"id":"3"},{"name":"name 4","age":29,"height":84,"weight":49,"id":"4"},{"name":"name 5","age":40,"height":18,"weight":33,"id":"5"},{"name":"name 6","age":79,"height":1,"weight":8,"id":"6"},{"name":"name 7","age":71,"height":5,"weight":64,"id":"7"},{"name":"name 8","age":72,"height":17,"weight":87,"id":"8"},{"name":"name 9","age":23,"height":46,"weight":64,"id":"9"},{"name":"name 10","age":6,"height":98,"weight":30,"id":"10"},{"name":"name 11","age":64,"height":11,"weight":45,"id":"11"},{"name":"name 12","age":51,"height":57,"weight":86,"id":"12"},{"name":"name 13","age":11,"height":30,"weight":93,"id":"13"},{"name":"name 14","age":2,"height":88,"weight":58,"id":"14"},{"name":"name 15","age":50,"height":54,"weight":76,"id":"15"},{"name":"name 16","age":17,"height":5,"weight":16,"id":"16"},{"name":"name 17","age":35,"height":35,"weight":78,"id":"17"},{"name":"name 18","age":90,"height":16,"weight":13,"id":"18"},{"name":"name 19","age":94,"height":86,"weight":45,"id":"19"},{"name":"name 20","age":69,"height":89,"weight":63,"id":"20"},{"name":"name 21","age":100,"height":97,"weight":77,"id":"21"},{"name":"name 22","age":78,"height":16,"weight":11,"id":"22"},{"name":"name 23","age":32,"height":77,"weight":82,"id":"23"},{"name":"name 24","age":16,"height":5,"weight":45,"id":"24"},{"name":"name 25","age":56,"height":10,"weight":17,"id":"25"},{"name":"name 26","age":9,"height":90,"weight":81,"id":"26"},{"name":"name 27","age":87,"height":64,"weight":46,"id":"27"},{"name":"name 28","age":14,"height":67,"weight":34,"id":"28"},{"name":"name 29","age":71,"height":79,"weight":46,"id":"29"},{"name":"name 30","age":78,"height":55,"weight":98,"id":"30"}]';
