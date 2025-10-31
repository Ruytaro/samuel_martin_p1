import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/services/state_manager.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';
import 'package:samuel_martin_c1/widgets/forms.dart';
import 'package:samuel_martin_c1/utils/notifications.dart';

Widget loginView(BuildContext context) {
  UserManager um = UserManager();
  StateManager sm = StateManager();
  String name = "";
  String pass = "";
  void doLogin() {
    if (um.logIn(name, pass)) {
      sm.set("main");
      Notifications.showMessage(context,"Logged");
      sm.doUpdate();
    } else {
      Notifications.showError(context, "Check credentials");
    }
  }

  return Center(
    child: Column(
      children: [
        Image.asset("images/logo.png", width: 150),
        myFormField((v){name=v;}, "name"),
        myFormField((v){pass=v;}, "pass",obscure: true),
        myElevatedButton(doLogin, Text("Login")),
      ],
    ),
  );
}
