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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
        onChanged: (value) => onChanged(value),
        obscureText: obscure,
      ),
    );
  }
}
