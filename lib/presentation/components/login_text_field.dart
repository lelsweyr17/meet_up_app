import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.obscure,
    required this.onChanged,
    required this.keyBoardType,
  }) : super(key: key);

  final String hintText;
  final bool obscure;
  final ValueChanged<String> onChanged;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFB3B3B3)),
        ),
        style: const TextStyle(color: Color(0xFF1A1A1A)),
        onChanged: (value) => onChanged(value),
        obscureText: obscure,
      ),
    );
  }
}
