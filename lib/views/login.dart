import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/services/screen_manager.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';
import 'package:samuel_martin_c1/widgets/forms.dart';
import 'package:samuel_martin_c1/utils/notifications.dart';

Widget loginView(BuildContext context){
  UserManager um = UserManager();
  ScreenManager sm = ScreenManager();
  late String name;
  late String pass;
  void doLogin(){
    if (um.logIn(name, pass)){
      sm.set("main");
      Notifications.showMessage(context,"Logged");
    } else {
      Notifications.showError(context, "Check credentials");
    }
  }
  return Center(
    child: Column(
      children: [
        Image.asset("images/logo.png",width: 150,),
        myFormField((l,v){name=v;}, "name"),
        myFormField((l,v){pass=v;}, "pass",obscure: true),
        myElevatedButton(doLogin,Text("Login"))
      ],
    ),
  );
}