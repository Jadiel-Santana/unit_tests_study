import 'package:unity_tests_study/models/person.dart';

abstract class PersonState {}

class PersonListState extends PersonState {
  final List<Person> data;

  PersonListState(this.data);
}

class PersonLoadingState extends PersonState {}

class PersonErrorState extends PersonState {
  final dynamic? error;

  PersonErrorState([this.error]);
}