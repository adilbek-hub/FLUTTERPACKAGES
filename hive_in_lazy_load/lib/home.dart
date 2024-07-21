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
    await box.put('age', 23);
    await box.put('children', ['Bakdoolot', 'Sergey', 'Alex']);
    await box.putAll({'famely': true, 'friends': false});
    final name = box.get('name') as String?;
    print(name);
    final age = box.get('age') as int?;
    print(age);
    // Default value is null
    final surName = box.get('surName', defaultValue: 'Asanov') as String?;
    print(surName);

    final children = box.get('children') as List?;
    print(children);
    final famelyFriends = box.get('famely') as bool?;
    final famelyFriends2 = box.get('friends') as bool?;
    print(famelyFriends);
    print(famelyFriends2);

    print('===========DELETE================');
    await box.delete('children');
    print(box.keys);
    print(box.values);

    box.close();
  }
}
