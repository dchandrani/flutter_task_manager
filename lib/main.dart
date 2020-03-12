import 'package:flutter/material.dart';
import 'package:task_manager/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      home: LoginScreen(),
    );
  }
}
