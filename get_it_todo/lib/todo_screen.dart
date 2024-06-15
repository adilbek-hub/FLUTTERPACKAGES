import 'package:flutter/material.dart';
import 'package:get_it_todo/add_todo_screen.dart';
import 'package:get_it_todo/main.dart';
import 'package:get_it_todo/todo_service.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoService _todoService = getIt<TodoService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTodoScreen())).then((_) {
                  setState(() {});
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () =>
            Future.delayed(const Duration(seconds: 1), () => setState(() {})),
        child: ListView.builder(
            itemCount: _todoService.todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = _todoService.todos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(index.toString()),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                      decoration:
                          todo.completed ? TextDecoration.lineThrough : null),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox.adaptive(
                        value: todo.completed,
                        onChanged: (value) {
                          _todoService.totalTodosStatus(index);
                          setState(() {});
                        }),
                    IconButton(
                        onPressed: () {
                          _todoService.deleteTodo(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
