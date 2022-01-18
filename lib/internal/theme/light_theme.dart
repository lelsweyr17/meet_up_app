import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  AppBarTheme get appBarTheme => const AppBarTheme(
        elevation: 0,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );

  DrawerThemeData get drawerTheme => const DrawerThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      );

  ThemeData get theme => ThemeData(
        appBarTheme: appBarTheme,
        drawerTheme: drawerTheme,
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      );
}
