import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  ThemeData get theme;
}

class DarkTheme extends AppTheme {
  AppBarTheme get _appBarTheme => AppBarTheme(
        elevation: 0,
        foregroundColor: const Color(0xff121212),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.9),
        ),
      );

  @override
  ThemeData get theme => ThemeData(
        appBarTheme: _appBarTheme,
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xff121212),
      );
}

class LightTheme implements AppTheme {
  AppBarTheme get _appBarTheme => const AppBarTheme(
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

  @override
  ThemeData get theme => ThemeData(
        appBarTheme: _appBarTheme,
        splashColor: Colors.orange[200],
        highlightColor: Colors.orange[200],
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      );
}
