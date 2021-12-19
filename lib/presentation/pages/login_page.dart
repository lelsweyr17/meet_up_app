import 'package:flutter/material.dart';
import 'package:meet_up_app/presentation/components/button.dart';
import 'package:meet_up_app/presentation/components/login_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginTextField(
              hintText: "Enter your email",
              obscure: false,
            ),
            SizedBox(height: 16),
            LoginTextField(
              hintText: "Enter your password",
              obscure: true,
            ),
            SizedBox(height: 16),
            Button(
              text: "Login",
              onPressed: () => print("button pressed"),
            ),
          ],
        ),
      ),
    );
  }
}
