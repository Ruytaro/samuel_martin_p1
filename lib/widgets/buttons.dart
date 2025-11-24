import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/widgets/padding.dart';

Widget myElevatedButton(VoidCallback? callback, Widget label) {
  return edgePadding(ElevatedButton(onPressed: callback, child: label));
}
