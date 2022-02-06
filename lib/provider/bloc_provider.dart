import 'package:flutter/material.dart';
import 'package:unity_tests_study/bloc/person_bloc.dart';

class BlocProvider extends InheritedWidget {
  final PersonBloc bloc;

  const BlocProvider({
    Key? key,
    required this.bloc,
    required Widget child,
  }) : super(key: key, child: child);

  static PersonBloc get(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<BlocProvider>();
    if (provider != null) {
      return provider.bloc;
    } else {
      throw Exception('Not found bloc');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as BlocProvider).bloc.state != bloc.state;
  }
}