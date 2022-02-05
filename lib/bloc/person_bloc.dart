import 'package:bloc/bloc.dart';
import 'package:unity_tests_study/bloc/person_state.dart';
import 'package:unity_tests_study/repository/person_repository.dart';

enum PersonEvent { clear, fetch }

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository repository;

  PersonBloc(this.repository) : super(PersonListState([])) {
    on<PersonEvent>((event, emit) async {
      if (event == PersonEvent.clear) {
        emit(PersonListState([]));
      } else if (event == PersonEvent.fetch) {
        emit(PersonLoadingState());
        try {
          final list = await repository.getPerson();
          emit(PersonListState(list));
        } catch (e) {
          emit(PersonErrorState(e));
        }
      }
    });
  }
}