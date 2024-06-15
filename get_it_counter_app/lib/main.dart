import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_counter_app/counter_service.dart';
import 'package:get_it_counter_app/home_screen.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

GetIt getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<CounterService>(CounterService());
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
      home: const HomeScreen(),
    );
  }
}
