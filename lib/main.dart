import 'package:flutter/material.dart';
import 'Containers/LoginContainer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Maestro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:LoginContainer(),
    );
  }
}

