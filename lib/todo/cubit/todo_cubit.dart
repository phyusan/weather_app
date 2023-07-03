import 'package:weather_app/repository/todo_repository.dart';
import 'package:weather_app/todo/cubit/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  final Repository _responsitory;
  TodoCubit(this._responsitory) : super(InitTodoState());

  Future<void> fetchTodo() async {
    emit(LoadingTodoState());
    try {
      final response = await _responsitory.getAll();

      emit(ReponseTodoState(response));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
      print(e.toString());
    }
  }
}
