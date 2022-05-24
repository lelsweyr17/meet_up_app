import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeYaLogo extends StatelessWidget {
  const SeeYaLogo({
    Key? key,
    this.fontSize = 48.0,
    this.color = Colors.white,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      "See ya",
      style: GoogleFonts.nunito(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
