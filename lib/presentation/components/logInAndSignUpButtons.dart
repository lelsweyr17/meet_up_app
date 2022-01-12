import 'package:flutter/material.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/buttons/lineat_gradient_button.dart';

class LogInAndSignUpButtons extends StatelessWidget {
  const LogInAndSignUpButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearGradientButton(
          text: AppLocalizations.of(context)!.logIn,
          onPressed: () => onNavigateLogInPressed(context),
        ),
        const SizedBox(height: 10),
        LinearGradientButton(
          text: AppLocalizations.of(context)!.signUp,
          onPressed: () => onNavigateToSignUpPressed(context),
        ),
      ],
    );
  }
}
