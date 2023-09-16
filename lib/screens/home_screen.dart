import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_with_hive/models/todo_model.dart';
import 'package:simple_todo_with_hive/screens/add_todo_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box todoBox = Hive.box<TodoModel>('todoBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
        
        ValueListenableBuilder(
            valueListenable: todoBox.listenable(),
            builder: (context, Box box, widget) {
              if (box.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text('No Todo Available '),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        TodoModel todo = box.getAt(index);
                        return Container(height: 50,
                        padding: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Center(child: Text(todo.tittle!)),
                          ),
                        );
                      }),
                );
              }
            }),
        Container(padding: const EdgeInsets.only(bottom: 30),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddToDo()));
              },
              child: const Text('Add Todo')),
        ),
      ]),
    );
  }
}
