import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unity_tests_study/bloc/person_bloc.dart';
import 'package:unity_tests_study/models/person.dart';
import 'package:unity_tests_study/provider/bloc_provider.dart';
import 'package:unity_tests_study/repository/person_repository.dart';
import 'package:unity_tests_study/view/home_page.dart';

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

  testWidgets('Deve mostrar todos os estados na tela',
      (WidgetTester tester) async {
    when(() => _repository.getPerson())
        .thenAnswer((_) async => <Person>[person, person]);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          bloc: _bloc,
          child: const HomePage(),
        ),
      ),
    );

    final textButton = find.byType(TextButton);
    expect(textButton, findsOneWidget);
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsNothing);
    final listPersons = find.byType(ListView);
    expect(listPersons, findsNothing);

    await tester.tap(textButton);

    await tester.runAsync(() => _bloc.stream.first);
    await tester.pump();
    expect(loading, findsOneWidget);

    await tester.runAsync(() => _bloc.stream.first);
    await tester.pump();
    expect(listPersons, findsOneWidget);
  });
}