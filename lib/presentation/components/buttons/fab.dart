import 'package:flutter/material.dart';
import 'package:meet_up_app/utils/gradients.dart';
import 'package:meet_up_app/utils/shadows.dart';

class Fab extends StatelessWidget {
  const Fab({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        gradient: Gradients.instance.yellowToRed(),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          Shadows.instance.black8(),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: const Center(
          child: Icon(
            Icons.add_rounded,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
