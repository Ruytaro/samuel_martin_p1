import 'package:flutter/material.dart';
import 'views/login.dart';
import 'widgets/appbar.dart';
import 'widgets/drawer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project 1',
      theme:  ThemeData(colorSchemeSeed: Colors.deepPurple,brightness: Brightness.light),
      darkTheme:  ThemeData(colorSchemeSeed: Colors.deepPurple,brightness: Brightness.dark),
      home: Scaffold(
        appBar: myAppBar(),
        drawer: myDrawer(),
        body: SingleChildScrollView(child: loginView()),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
