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

  Future<void> showPassword(String? username) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account recovery'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("This is what we know about $username"),
                um.recoverPassword(username),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> promtUsername() async {
    String? username;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account recovery'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("We're going to recover your password"),
                Text('Please type your username:'),
                myFormField((name) {
                  username = name;
                }, "Username"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Search'),
              onPressed: () {
                Navigator.of(context).pop();
                showPassword(username);
              },
            ),
          ],
        );
      },
    );
  }

  void doLogin() {
    if (um.logIn(name, pass)) {
      sm.set("main");
      Notifications.showMessage(context, "Logged");
    } else {
      Notifications.showError(context, "Check credentials");
    }
    sm.doUpdate();
  }

  return Center(
    child: Column(
      children: [
        Image.asset("images/logo.png", width: 150),
        myFormField((v) {
          name = v;
        }, "name"),
        myFormField(
          (v) {
            pass = v;
          },
          "pass",
          obscure: true,
        ),
        myElevatedButton(doLogin, Text("Login")),
        myElevatedButton(() {
          sm.set("register");
          sm.doUpdate();
        }, Text("Register")),
        if (um.hasFailedLogins())
          myElevatedButton(promtUsername, Text("Recover account")),
      ],
    ),
  );
}
