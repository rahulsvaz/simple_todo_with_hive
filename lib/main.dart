import 'package:flutter/material.dart';
import 'package:simple_todo_with_hive/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Todo App',
      themeMode:ThemeMode.dark ,
     theme: ThemeData(
      useMaterial3: true
      
     ),
     home: HomeScreen(),
    );
  }
}