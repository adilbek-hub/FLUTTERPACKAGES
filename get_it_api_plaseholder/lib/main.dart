import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_api_plaseholder/api_service.dart';
import 'package:get_it_api_plaseholder/my_home_page.dart';

GetIt getIt = GetIt.instance;
void getRegister() {
  getIt.registerLazySingleton(() => ApiService());
}

void main() {
  getRegister();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
