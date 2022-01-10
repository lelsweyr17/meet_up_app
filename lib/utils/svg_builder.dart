import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgBuilder {
  const SvgBuilder({
    required this.path,
    this.color = const Color(0x000d0d0d),
    this.size = 24.0,
  });

  final String path;
  final Color color;
  final double size;

  Widget build() {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
    );
  }
}
