import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    Key? key,
    required this.gradient,
    required this.body,
  }) : super(key: key);

  final Gradient gradient;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
