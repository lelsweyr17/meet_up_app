import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBars {
  const AppBars._create();

  static const AppBars _instance = AppBars._create();

  static AppBars get instance => _instance;

  PreferredSizeWidget transparentAppBarWithWhiteStatusBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.orange,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  PreferredSizeWidget transparentAppBarWithBlackStatusBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.orange,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }
}
