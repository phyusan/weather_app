import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_cubit.dart';
import '../cubit/todo_state.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cubit Api call'),
        ),
        body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
          if (state is InitTodoState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ReponseTodoState) {
            final todos = state.todos;
            return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return ListTile(
                      leading: Text(todo.id.toString() ?? 'Unknown'),
                      title: Text(todo.title!));
                });
          }
          return Center(child: Text(state.toString()));
        }));
  }
}
