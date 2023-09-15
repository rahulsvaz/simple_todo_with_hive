import 'package:flutter/material.dart';

class AddToDo extends StatelessWidget {
  const AddToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(),
          const SizedBox(
            height: 30,
          ),
          Card(
            
            child: ElevatedButton(onPressed: () {}, child: const Text('Save ToDo'))),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Discard')),
        ],
      )),
    );
  }
}
