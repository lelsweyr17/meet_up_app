import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.obscure,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final bool obscure;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: (value) => onChanged(value),
      obscureText: obscure,
    );
  }
}
