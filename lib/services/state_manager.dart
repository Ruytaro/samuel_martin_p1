import 'package:flutter/material.dart';

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
  String get getScreen => _screen;

  void doUpdate(BuildContext context) {
    _updateCallback(context);
  }

  void setCallback(void Function(BuildContext) update) {
    _updateCallback = update;
  }
}
