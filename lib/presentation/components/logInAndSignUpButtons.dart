import 'package:flutter/material.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/button.dart';

class LogInAndSignUpButtons extends StatelessWidget {
  const LogInAndSignUpButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
          text: AppLocalizations.of(context)!.logIn,
          onPressed: () => onNavigateLogInPressed(context),
        ),
        Button(
          text: AppLocalizations.of(context)!.signUp,
          onPressed: () => onNavigateToSignUpPressed(context),
        ),
      ],
    );
  }
}
