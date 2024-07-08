import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_with_bloc/bloc/person_bloc.dart';
import 'package:get_it_with_bloc/home_page.dart';
import 'package:get_it_with_bloc/service_locator.dart';

void main() {
  ServiceLocator.instance.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonBloc>(
      create: (context) => ServiceLocator.instance.getIt<PersonBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
