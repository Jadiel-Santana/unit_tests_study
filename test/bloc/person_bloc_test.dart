import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unity_tests_study/bloc/person_bloc.dart';
import 'package:unity_tests_study/bloc/person_state.dart';
import 'package:unity_tests_study/models/person.dart';
import 'package:unity_tests_study/repository/person_repository.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  late PersonBloc _bloc;
  late PersonRepository _repository;
  final person = Person(
    id: '0',
    name: 'Jadiel Santana',
    age: 25,
    height: 1.83,
    weight: 87.6,
  );


  setUp(() {
    _repository = PersonRepositoryMock();
    _bloc = PersonBloc(_repository);
  });

  test('Deve retornar uma List<Person>', () async {
    when(() => _repository.getPerson()).thenAnswer((_) async => <Person>[
      person, person
    ]);

    _bloc.add(PersonEvent.fetch);
    await expectLater(_bloc.state, emitsInOrder([
      isA<PersonLoadingState>(),
      isA<PersonListState>(),
    ]));
  });

  test('Deve retornar uma Exception', () async {
    when(() => _repository.getPerson()).thenThrow(Exception('deu error'));

    _bloc.add(PersonEvent.fetch);

    await expectLater(
        _bloc.state, emitsInOrder([
          isA<PersonLoadingState>(),
          isA<PersonErrorState>(),
        ]));
  });
}