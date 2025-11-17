import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/views/login.dart';
import 'package:samuel_martin_c1/views/logout.dart';
import 'package:samuel_martin_c1/views/main.dart';
import 'package:samuel_martin_c1/views/register.dart';

class StateManager {
  static final StateManager _manager = StateManager._internal();
  StateManager._internal();

  factory StateManager() {
    return _manager;
  }
  String _screen = "login";
  void set(String newScreen) {
    _screen = newScreen;
  }

  ScaffoldMessenger messenger = ScaffoldMessenger(child: Text("data"));

  late Function() _updateCallback;

  void doUpdate( ) {
    _updateCallback();
  }

  void setCallback(void Function() update) {
    _updateCallback = update;
  }

  Widget? getScreen(BuildContext context) {
    switch (_screen) {
      case "main":
        return SingleChildScrollView(child: mainView(context));
      case "login":
        return SingleChildScrollView(child: loginView(context));
      case "logout":
        return SingleChildScrollView(child: logoutView(context));
      case "register":
        return SingleChildScrollView(child: registerView(context));
      default:
        return SingleChildScrollView(child: loginView(context));
    }
  }
}
