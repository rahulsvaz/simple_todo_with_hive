import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_todo_with_hive/models/todo_model.dart';
import 'package:simple_todo_with_hive/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todoBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Todo App',
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
