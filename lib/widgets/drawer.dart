import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/services/state_manager.dart';

import '../services/user_manager.dart';

Drawer? myDrawer() {
  UserManager um = UserManager();
  StateManager sm = StateManager();
  if (UserManager().getCurrentUser == null) {
    return null;
  }
  if (um.isAdmin()) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("Main Menu")),
          ElevatedButton(
            onPressed: () {
              sm.set("register");
              sm.doUpdate();
            },
            child: Text("Register new user"),
          ),
        ],
      ),
    );
  } else {
    return Drawer(
      child: Column(children: [DrawerHeader(child: Text("User menu"))]),
    );
  }
}
