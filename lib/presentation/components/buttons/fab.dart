import 'package:flutter/material.dart';
import 'package:meet_up_app/utils/gradients.dart';

class Fab extends StatelessWidget {
  const Fab({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: Gradients.instance.yellowToRed(),
      ),
      child: FloatingActionButton(
        onPressed: onTap,
        elevation: 0,
        highlightElevation: 0,
        clipBehavior: Clip.antiAlias,
        backgroundColor: Colors.transparent,
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
