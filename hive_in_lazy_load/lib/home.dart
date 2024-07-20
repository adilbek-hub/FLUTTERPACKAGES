import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final exampleWidgetModel = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: exampleWidgetModel.doSome,
          child: const Text('Click Me'),
        ),
      ),
    );
  }
}

class ExampleWidgetModel {
  void doSome() async {
    var box = await Hive.openBox<dynamic>('testExample');
    await box.put('name', 'Asan');
    await box.put(10, 'Hundrad');
    final name = box.get('name') as String?;
    final number = box.get(10) as String?;
    print(name);
    print(number);
  }
}
