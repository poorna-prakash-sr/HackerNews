
import 'package:flutter/material.dart';


const brightness = Brightness.light;
const primaryColor = const Color(0xFFF48B90);
const lightColor = const Color(0xFFFFFFFF);
const backgroundColor = const Color(0xFFFFFFFF);


ThemeData mainTheme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: Colors.white,

    backgroundColor: backgroundColor,
  );
}