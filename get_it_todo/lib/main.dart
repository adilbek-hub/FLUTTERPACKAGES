import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_todo/todo_screen.dart';
import 'package:get_it_todo/todo_service.dart';

GetIt getIt = GetIt.instance;
void setupLocator() =>
    getIt.registerLazySingleton<TodoService>(() => TodoService());
void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}
