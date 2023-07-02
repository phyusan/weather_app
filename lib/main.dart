import 'package:flutter/material.dart';
import 'package:weather_app/repository/todo_repository.dart';
import 'package:weather_app/todo/cubit/todo_cubit.dart';
import 'package:weather_app/todo/view/todo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TodoCubit(Repository()),
        child: const MaterialApp(
          home: TodoPage(),
        ));
  }
}
