// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_with_hive/models/todo_model.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();
    Box todoBox = Hive.box<TodoModel>('todoBox');
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: todoController,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                if (todoController.text != null) {
                  TodoModel newTodo = TodoModel(
                      tittle: todoController.text.toString(),
                      isCompleted: false);
                  todoBox.add(newTodo);
                  Navigator.pop(context);
                }
              },
              child: const Text('Save ToDo')),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                todoController.clear();
                Navigator.pop(context);
              },
              child: const Text('Discard')),
        ],
      )),
    );
  }
}
