// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddToDo extends StatefulWidget {
  const AddToDo({Key? key}) : super(key: key);

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  // Create text editing controllers for the title and description text fields
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> submitToDo() async {
    // Get the data from the form
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    // POST the form data to the API
    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    // Show success or failure message based on the response status code and reset the text fields
    if (response.statusCode == 201) {
      // If successful, reset the text fields
      titleController.text = '';
      descriptionController.text = '';

      // Show a success message using a SnackBar with a custom style
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Center(
            child: Text(
              '👍🏻',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      );
    } else {
      // If not successful, show a failure message using a SnackBar with a custom style
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 17, 0),
          content: Center(
            child: Text(
              '👎🏻',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: false,
      ),
      body: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when tapping outside of the text fields
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              // Title TextField
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                ),
              ),
              // Divider
              const Divider(),
              // Description TextField
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
                maxLength: 3000,
              ),
            ],
          ),
        ),
      ),
      // FloatingActionButton to submit the form data
      floatingActionButton: FloatingActionButton(
        onPressed: submitToDo,
        child: const Icon(Icons.send_rounded),
      ),
    );
  }
}
