import 'package:flutter/foundation.dart';

class Log {
  static void message(String tag, String message) {
    if (kDebugMode) {
      print("[$tag]: $message");
    }
  }
}