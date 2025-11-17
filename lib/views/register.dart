import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/services/state_manager.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'package:samuel_martin_c1/widgets/adminCheckBox.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';
import 'package:samuel_martin_c1/widgets/forms.dart';
import 'package:samuel_martin_c1/utils/notifications.dart';
import 'package:samuel_martin_c1/models/user.dart';

Widget registerView(BuildContext context) {
  UserManager um = UserManager();
  StateManager sm = StateManager();
  String name = "";
  String pass = "";
  String pass2 = "";
  String age = "";
  bool admin = false;
  void doRegister() {
    if(pass != pass2){
      Notifications.showError(context, "Passwords doesn't match!");
      return;
    }
    User newUser = User(name, pass);
    newUser.age=age as int;
    if (newUser.age < 18 || newUser.age > 100){

    }
    newUser.admin=admin;

    if (um.register(newUser)) {
      sm.set("main");
      Notifications.showMessage(context, "Account created");
      sm.doUpdate();
    } else {
      Notifications.showError(context, "Check user data");
    }
  }

  return Center(
    child: Column(
      children: [
        Image.asset("images/logo.png", width: 150),
        myFormField((v) {
          name = v;
        }, "Username"),
        myFormField(
          (v) {
            pass = v;
          },
          "Password",
          obscure: true,
        ),
        myFormField(
          (v) {
            pass2 = v;
          },
          "Retype password",
          obscure: true,
        ),
        myFormField((v) {
          age = v;
        }, "Type your age"),
        if (um.isAdmin()) adminCheckBox(),

        myElevatedButton(doRegister, Text("Create account")),
      ],
    ),
  );
}
