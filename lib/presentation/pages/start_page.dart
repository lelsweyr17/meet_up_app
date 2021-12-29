import 'package:flutter/material.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/logInAndSignUpButtons.dart';

const _tag = "start_page";

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
            const LogInAndSignUpButtons(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Text(_localizations.skip),
                onTap: () => onSkipPressed(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
