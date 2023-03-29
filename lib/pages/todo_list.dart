import 'package:apicrud/pages/add_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          return navigateTodoPage();
        },
        label: const Text("Add Todo"),
      ),
    );
  }

  void navigateTodoPage() {
    final route = MaterialPageRoute(
      builder: (context) {
        return const AddTodoPage();
      },
    );
    Navigator.push(context, route);
  }

  //get all task
  Future<void> fetchTodo() async {
    const url = 'http://127.0.0.1:8000/api/task/all';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    print(response.body);
  }
}
