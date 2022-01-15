import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  AppBarTheme get appBarTheme => AppBarTheme(
        elevation: 0,
        foregroundColor: const Color(0xff121212),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black.withOpacity(0.9),
        ),
      );

  DrawerThemeData get drawerTheme => const DrawerThemeData(
        backgroundColor: Color(0xff121212),
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
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xff121212),
      );
}
