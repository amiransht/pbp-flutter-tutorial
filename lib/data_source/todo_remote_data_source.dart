import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/todo.dart';

class TodoRemoteDataSource {
  Future<List<Todo>> fetchToDo() async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?_start=0&_limit=10');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Todo> listToDo = [];
    for (var d in data) {
      if (d != null) {
        listToDo.add(Todo.fromJson(d));
      }
    }

    return listToDo;
  }
}