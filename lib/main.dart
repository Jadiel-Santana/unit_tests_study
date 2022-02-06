import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unity_tests_study/bloc/person_bloc.dart';
import 'package:unity_tests_study/view/home_page.dart';
import 'package:unity_tests_study/provider/bloc_provider.dart';
import 'package:unity_tests_study/repository/person_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unity Test Study',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        bloc: PersonBloc(PersonRepository(Client())),
        child: const HomePage(),
      ),
    );
  }
}