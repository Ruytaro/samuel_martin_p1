import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/models/user.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'package:samuel_martin_c1/services/state_manager.dart';
import 'package:samuel_martin_c1/views/main.dart';
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
  StateManager sm = StateManager();
  Widget? _body;
  @override
  Widget build(BuildContext context) {
    void updateState(BuildContext context) {
      setState(() {
        switch (sm.getScreen) {
          case "main":
            _body=SingleChildScrollView(child: mainView(context));
            break;
          default:
            _body=SingleChildScrollView(child: loginView(context));
        }
      });
    }
    updateState(context);
    um.register(User("asd", "asd"));
    sm.setCallback(updateState);

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
            body: _body,
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
