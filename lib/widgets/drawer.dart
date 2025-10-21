import 'package:flutter/material.dart';

import '../services/user_manager.dart';

Drawer myDrawer(){
return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("Menu")),
          ListTile(
            title: Text("LogOut"),
            onTap: () {
              UserManager().logOut();
            },
          ),
          
        ],
      ),
    );
  }
