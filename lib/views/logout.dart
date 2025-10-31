import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/services/state_manager.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';

Widget logoutView(BuildContext context) {
  StateManager sm = StateManager();
  return Center(
    child: myElevatedButton(() {
      sm.set("login");
      sm.doUpdate();
    }, Text("Go to login")),
  );
}
