import 'package:flutter/material.dart';
import 'package:get_it_todo/main.dart';
import 'package:get_it_todo/todo_service.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TodoService _todoService = getIt<TodoService>();
  final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddTodo'),
      ),
      body: Column(
        children: [
          TextField(controller: titleController),
          const SizedBox.square(dimension: 10),
          ElevatedButton(
              onPressed: () {
                _todoService.addTodo(titleController.text);
                Navigator.pop(context);
              },
              child: const Text('Add'))
        ],
      ),
    );
  }
}
