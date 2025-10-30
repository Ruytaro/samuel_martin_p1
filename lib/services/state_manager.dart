import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/views/login.dart';
import 'package:samuel_martin_c1/views/main.dart';

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

  late Function(BuildContext) _updateCallback;

  void doUpdate(BuildContext context) {
    _updateCallback(context);
  }

  void setCallback(void Function(BuildContext) update) {
    _updateCallback = update;
  }

  Widget? getScreen(BuildContext context) {
    switch (_screen) {
      case "main":
        return SingleChildScrollView(child: mainView(context));
      case "login":
        return SingleChildScrollView(child: loginView(context));
      default:
        return SingleChildScrollView();
    }
  }
}
