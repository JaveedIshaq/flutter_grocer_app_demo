import 'package:flutter_grocer_app/core/config/colors.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:flutter/services.dart';

updateStatusBarColor(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
}

updateStatusBarColorDark(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
}

updateStatusBarColorYellow(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: grocerGreen,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
}
