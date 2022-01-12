import 'package:flutter/material.dart';

class Shadows {
  const Shadows._create();

  static const Shadows _instance = Shadows._create();

  static Shadows get instance => _instance;

  BoxShadow black8() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.08),
      spreadRadius: 4,
      blurRadius: 8,
      offset: const Offset(0, 4),
    );
  }

  BoxShadow red28() {
    return BoxShadow(
      color: const Color(0xFFE71D36).withOpacity(0.28),
      spreadRadius: 4,
      blurRadius: 8,
      offset: const Offset(0, 4),
    );
  }
}
