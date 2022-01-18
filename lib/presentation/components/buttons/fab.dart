import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [Shadows.instance.black8()],
      ),
      child: FloatingActionButton.extended(
        onPressed: () {},
        elevation: 0,
        highlightElevation: 0,
        clipBehavior: Clip.antiAlias,
        label: const Text(
          "Create meeting",
          style: TextStyle(
            fontSize: 16,
            letterSpacing: -0.33,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.add_rounded,
          color: Colors.orange,
        ),
      ),
    );
  }
}
