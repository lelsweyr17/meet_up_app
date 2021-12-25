import 'package:flutter/material.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_event.dart';
import 'package:meet_up_app/presentation/components/button.dart';
import 'package:meet_up_app/presentation/components/login_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginTextField(
              hintText: "Enter your email",
              obscure: false,
              onChanged: (value) => _authBloc.emailSink.add(value),
            ),
            const SizedBox(height: 16),
            LoginTextField(
              hintText: "Enter your password",
              obscure: true,
              onChanged: (value) => _authBloc.passwordSink.add(value),
            ),
            const SizedBox(height: 16),
            Button(
              text: "Login",
              onPressed: () => _authBloc.inEvent.add(AuthEvent.logIn),
            ),
          ],
        ),
      ),
    );
  }
}
