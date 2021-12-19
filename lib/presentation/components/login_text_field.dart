import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.obscure,
  }) : super(key: key);

  final String hintText;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      obscureText: obscure,
    );
  }
}
