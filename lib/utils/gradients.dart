import 'package:flutter/material.dart';

class Gradients {
  const Gradients._create();

  static const Gradients _instance = Gradients._create();

  static Gradients get instance => _instance;

  LinearGradient yellowToRed() {
    return const LinearGradient(
      colors: [
        Color(0xFFFF9F1C),
        Color(0xFFEE6071),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }
}
