import 'package:flutter/material.dart';
import 'package:meet_up_app/presentation/components/button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              text: "Log In",
              onPressed: () => onLoginPressed(context),
            ),
            Button(
              text: "Sign Up",
              onPressed: () => onSignUpPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  void onLoginPressed(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  void onSignUpPressed(BuildContext context) {
    Navigator.pushNamed(context, "/signUp");
  }
}
