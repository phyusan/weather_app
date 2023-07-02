import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo_model.dart';

class Repository {
  Future<dynamic> getAll() async {
    const endpoint = 'https://jsonplaceholder.typicode.com/todos';
    final url = Uri.parse(endpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      final result = json.map((e) {
        return Todo(
            id: e['id'],
            userId: e['userId'],
            title: e['titile'],
            completed: e['completed']);
      }).toList();
      return result;
    } else {
      throw "Something went wrongcode ${response.statusCode}";
    }
  }
}
