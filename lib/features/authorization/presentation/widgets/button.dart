import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    this.isOutlined = false,
    this.textColor,
    this.buttonColor,
    this.onPressed,
  })  : assert((!isOutlined && buttonColor != null) || (isOutlined)),
        super(key: key);

  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      primary: textColor ?? Colors.white,
      backgroundColor: isOutlined ? Colors.transparent : buttonColor,
      minimumSize: const Size(166, 46),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      side: BorderSide(
        color: buttonColor ?? Colors.white,
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
