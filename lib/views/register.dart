import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/services/state_manager.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'package:samuel_martin_c1/utils/validators.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';
import 'package:samuel_martin_c1/widgets/forms.dart';
import 'package:samuel_martin_c1/utils/notifications.dart';
import 'package:samuel_martin_c1/models/user.dart';

Widget registerView(BuildContext context) {
  UserManager um = UserManager();
  StateManager sm = StateManager();
  final formKey = GlobalKey<FormState>();
  String name = "";
  String pass = "";
  String pass2 = "";
  String age = "";
  bool admin = false;
  void doRegister() {
    if (!formKey.currentState!.validate()) {
      Notifications.showError(context, "Review the form");
    }
    User newUser = User(name, pass);
    newUser.admin = admin;

    if (um.register(newUser)) {
      sm.set("main");
      Notifications.showMessage(context, "Account created");
      sm.doUpdate();
    } else {
      Notifications.showError(context, "Check user data");
    }
  }

  return Center(
    child: Form(
      key: formKey,
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
            validator: validateStrongPassword,
          ),
          TextFormField(
            onChanged: (value) => pass2,
            validator: (value) {
              if (value != pass) {
                return "Retype the password!";
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Retype password",
              border: OutlineInputBorder(),
              constraints: BoxConstraints(maxWidth: 300),
            ),
          ),
          myFormField((v) => age, "Type your age", validator: validateNumber),
          if (um.isAdmin())
            Center(
              child: Row(
                children: [
                  Text("Give admin"),
                  Checkbox(value: admin, onChanged: (value) => admin),
                ],
              ),
            ),

          myElevatedButton(doRegister, Text("Create account")),
        ],
      ),
    ),
  );
}
