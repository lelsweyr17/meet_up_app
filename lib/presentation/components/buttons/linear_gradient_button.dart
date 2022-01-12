import 'package:flutter/material.dart';
import 'package:meet_up_app/utils/gradients.dart';
import 'package:meet_up_app/utils/shadows.dart';

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
        gradient: Gradients.instance.yellowToRed(),
        boxShadow: [
          Shadows.instance.red28(),
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
