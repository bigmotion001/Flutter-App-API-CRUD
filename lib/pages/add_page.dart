import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  //form data
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [

          TextField(
            controller: titleController,
            autofocus: true,
            decoration: const InputDecoration(hintText: "Title"),
          ),

          TextField(
            controller: descriptionController,
            autofocus: true,
            decoration: const InputDecoration(hintText: "Description"),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),

          const SizedBox(
            height: 20,
          ),

          ElevatedButton(
            onPressed: submitData,
            child: const Text("Submit Todo"),
          ),
        ],
      ),
    );
  }

  //submit form method
  Future<void> submitData() async {
    //get data from form
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //submit data to the server
    const url = 'http://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'ContentType': 'application/json'},
    );
    //show success or fail message base on status
   
    print(response.statusCode);
    print(response.body);
  }
}
