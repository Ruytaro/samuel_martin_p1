import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/widgets/forms.dart';

Widget loginView(){
  return Center(
    child: Column(
      children: [
        Image.asset("images/logo.png",width: 150,),
        myFormField((l,v){}, "name"),
        myFormField((l,v){}, "pass",obscure: true),
      ],
    ),
  );
}