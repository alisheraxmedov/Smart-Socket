import 'package:flutter/material.dart';
import 'package:oldiot/component/color.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: ColorsClass.white,
      ),
      iconTheme: IconThemeData(
        color: ColorsClass.white,
        size: 30.0
        // size: 24.0
      ),
    ),
  );
}
