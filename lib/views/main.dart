import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/models/user.dart';
import 'package:samuel_martin_c1/services/state_manager.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'package:samuel_martin_c1/utils/notifications.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';

Widget mainView(BuildContext context) {
  UserManager um = UserManager();
  StateManager sm = StateManager();
  User me = um.getCurrentUser!;
  return Center(
    child: Column(
      children: [
        Text("Welcome ${me.username}"),
        myElevatedButton(() {
          Notifications.showMessage(context, "Logout");
          um.logOut();
          sm.set("login");
          sm.doUpdate(context);
        }, Text("Logout!")),
      ],
    ),
  );
}
