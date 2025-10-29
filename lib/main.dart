import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/models/user.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'views/login.dart';
import 'widgets/appbar.dart';
import 'widgets/drawer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserManager um = UserManager();

  @override
  Widget build(BuildContext context) {
  um.register(User("asd", "asd"));
    return MaterialApp(
      title: 'Flutter Project 1',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: myAppBar(),
            drawer: myDrawer(),
            body: SingleChildScrollView(child: loginView(context)),
          );
        }
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
