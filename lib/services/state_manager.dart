import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/views/login.dart';
import 'package:samuel_martin_c1/views/logout.dart';
import 'package:samuel_martin_c1/views/main.dart';
import 'package:samuel_martin_c1/views/register.dart';

class StateManager extends ChangeNotifier {
  static final StateManager _manager = StateManager._internal();
  StateManager._internal();

  factory StateManager() {
    return _manager;
  }

  String _screen = "login";

  void set(String newScreen) {
    _screen = newScreen;
    notifyListeners();
  }

  ScaffoldMessenger messenger = ScaffoldMessenger(child: Text("data"));

  Widget? getScreen() {
    switch (_screen) {
      case "main":
        return SingleChildScrollView(child: MainView());
      case "login":
        return SingleChildScrollView(child: LoginView());
      case "logout":
        return SingleChildScrollView(child: LogoutView());
      case "register":
        return SingleChildScrollView(child: RegisterView());
      default:
        return SingleChildScrollView(child: LoginView());
    }
  }
}
