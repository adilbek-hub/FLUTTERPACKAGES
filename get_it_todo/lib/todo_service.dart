import 'package:get_it_todo/todo_model.dart';

class TodoService {
  final List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Todo(title: title));
  }

  void totalTodosStatus(int index) {
    _todos[index].completed = !_todos[index].completed;
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
  }
}
