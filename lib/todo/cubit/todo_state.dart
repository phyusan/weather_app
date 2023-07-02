import 'package:weather_app/models/todo_model.dart';

abstract class TodoState {}

class InitTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class ErrorTodoState extends TodoState {
  final String message;
  ErrorTodoState(this.message);
}

class ReponseTodoState extends TodoState {
  final List<Todo> todos;
  ReponseTodoState(this.todos);
}
