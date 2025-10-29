import 'package:flutter/material.dart';

import '../services/user_manager.dart';

Drawer? myDrawer(){
  UserManager manager = UserManager();
if (manager.getCurrentUser == null){
  return null;
}
return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("Menu"),),
        ],
      ),
    );
  }
