import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgBuilder {
  SvgBuilder({
    required this.path,
    this.isIcon = true,
    this.color,
    this.size = 24.0,
  });

  final String path;
  Color? color;
  double size;
  bool isIcon;

  Widget build() {
    if (isIcon) {
      return SvgPicture.asset(
        path,
        width: size,
        height: size,
        color: color ?? const Color(0xff180805),
      );
    } else {
      return SvgPicture.asset(
        path,
        width: size,
        height: size,
      );
    }
  }
}
