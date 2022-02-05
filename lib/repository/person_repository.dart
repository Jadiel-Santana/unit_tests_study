import 'dart:convert';

import 'package:http/http.dart';
import 'package:unity_tests_study/models/person.dart';

class PersonRepository {
  final Client _client;

  PersonRepository(this._client);

  Future<List<Person>> getPerson() async {
    final response = await _client.get(
      Uri.parse(
        'https://61febcf8a58a4e00173c99a3.mockapi.io/api/v1/person/person',
      ),
    );
    if(response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((e) => Person.fromMap(e)).toList();
    } else {
      throw Exception('Erro na internet');
    }
  }
}