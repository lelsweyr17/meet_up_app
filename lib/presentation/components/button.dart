import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.buttonColor = Colors.transparent,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      primary: textColor,
      backgroundColor: buttonColor,
      minimumSize: const Size(88, 46),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      side: BorderSide(
        color: textColor == Colors.white ? textColor : Colors.transparent,
        width: 1,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );

    return OutlinedButton(
      onPressed: onPressed,
      style: outlineButtonStyle,
      child: Text(text),
    );
  }
}
