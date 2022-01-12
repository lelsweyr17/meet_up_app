import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/buttons/button.dart';
import 'package:meet_up_app/utils/gradients.dart';

const _tag = "start_page";

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localizations = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: Gradients.instance.yellowToRed(),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "See ya",
                  style: GoogleFonts.nunito(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Button(
                          text: AppLocalizations.of(context)!.logIn,
                          onPressed: () => onNavigateLogInPressed(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Button(
                          textColor: Colors.deepOrangeAccent,
                          buttonColor: Colors.white,
                          text: AppLocalizations.of(context)!.signUp,
                          onPressed: () => onNavigateToSignUpPressed(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
