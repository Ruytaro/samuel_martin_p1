import 'package:flutter/material.dart';

class Notifications{

 static void showMessage(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message),backgroundColor: Colors.green,));
  }

 static void showError(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message,),backgroundColor:  Colors.red),);
  }

}