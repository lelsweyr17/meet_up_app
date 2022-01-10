import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgBuilder {
  SvgBuilder({
    required this.path,
    this.color = const Color(0x000d0d0d),
    this.size = 24.0,
  });

  final String path;
  Color color;
  double size;

  Widget build() {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
    );
  }
}
