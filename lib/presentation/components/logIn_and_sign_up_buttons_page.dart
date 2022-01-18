import 'package:flutter/material.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/buttons/linear_gradient_button.dart';

import 'app_bars.dart';

class LogInAndSignUpButtonsPage extends StatelessWidget {
  const LogInAndSignUpButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.instance.transparentAppBarWithBlackStatusBar(),
      body: Center(
        child: Column(
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
        ),
      ),
    );
  }
}
