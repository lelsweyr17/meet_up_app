import 'package:flutter/material.dart';

class LinearGradientButton extends StatelessWidget {
  const LinearGradientButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 166,
        minHeight: 46,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFFF9F1C),
            Color(0xFFEE6071),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE71D36).withOpacity(0.28),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        clipBehavior: Clip.antiAlias,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
