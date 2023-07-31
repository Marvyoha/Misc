import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AddToDo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    getToDo();
  }

  Future<void> editToDo(Map item) async {
    final route = MaterialPageRoute(builder: (context) => AddToDo(todo: item));
    await Navigator.push(context, route);
  }

  Future<void> addToDo() async {
    final route = MaterialPageRoute(builder: (context) => const AddToDo());
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    getToDo();
  }

  // Function for creating a snackbar
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        content: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  // Fetch data from the API
  Future<void> getToDo() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // If the request is successful, parse the response data and update the list
      final json = jsonDecode(response.body) as Map;
      final results = json['items'];
      setState(() {
        items = results;
      });
    } else {
      // Show error message if the request fails
      showErrorMessage('No internet connection');
    }
    setState(() {
      isLoading = false;
    });
  }

  // Function to delete an item by ID
  Future<void> deleteToDo(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      // If the deletion is successful, update the list
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      showErrorMessage('Deletion failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotePad'),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          color: const Color.fromARGB(255, 255, 17, 0),
          onRefresh: getToDo,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'] as String;

              return ListTile(
                leading: CircleAvatar(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey,
                  child: Text('${index + 1}'),
                ),
                title: Text(item['title']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['description']),
                    const Divider(),
                  ],
                ),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'edit') {
                      // Handle edit action here
                      editToDo(item);
                    } else if (value == 'delete') {
                      // Handle delete action here
                      deleteToDo(id);
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ];
                  },
                ),
              );
            },
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 255, 17, 0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addToDo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
