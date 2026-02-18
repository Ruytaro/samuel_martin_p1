import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/models/user.dart';
import 'package:samuel_martin_c1/services/state_manager.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'package:samuel_martin_c1/utils/notifications.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late UserManager um;
  late StateManager sm;
  late User me;

  @override
  void initState() {
    super.initState();
    um = UserManager();
    sm = StateManager();
    me = um.getCurrentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Welcome ${me.username}"),
          myElevatedButton(
            () {
              Notifications.showMessage(context, "Logout");
              um.logOut();
              sm.set("logout");
            },
            Text("Logout!"),
          ),
        ],
      ),
    );
  }
}