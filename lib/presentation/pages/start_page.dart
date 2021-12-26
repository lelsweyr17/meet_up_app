import 'package:flutter/material.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              text: _localizations.logIn,
              onPressed: () => _onLoginPressed(context),
            ),
            Button(
              text: _localizations.signUp,
              onPressed: () => _onSignUpPressed(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Text(_localizations.skip),
                onTap: () => _onSkipPressed(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  void _onSignUpPressed(BuildContext context) {
    Navigator.pushNamed(context, "/signUp");
  }

  void _onSkipPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }
}
