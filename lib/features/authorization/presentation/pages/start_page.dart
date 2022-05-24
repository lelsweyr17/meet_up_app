import 'package:flutter/material.dart';
import 'package:meet_up_app/features/authorization/presentation/logic/authorization_logic.dart';
import 'package:meet_up_app/features/authorization/presentation/widgets/button_with_bottom_sheet_on_tap.dart';
import 'package:meet_up_app/features/authorization/presentation/widgets/gradient_scaffold.dart';
import 'package:meet_up_app/core/utils/context_helper.dart';
import 'package:meet_up_app/core/utils/gradients.dart';
import 'package:meet_up_app/injection_container.dart';
import 'package:provider/provider.dart';

import '../widgets/see_ya_logo.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => getIt<AuthorizationLogic>(),
      child: const StartPageView(),
    );
  }
}

class StartPageView extends StatelessWidget {
  const StartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authLogic = context.read<AuthorizationLogic>();

    return GradientScaffold(
      gradient: Gradients.yellowToRed(),
      body: SafeArea(
        child: Stack(
          children: [
            const Center(child: SeeYaLogo()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWithBottomSheetOnTap(
                      text: context.localizations.logIn,
                      isOutlined: true,
                      onBottomSheetButtonPressed: authLogic.onLoginPressed,
                    ),
                    const SizedBox(width: 16),
                    ButtonWithBottomSheetOnTap(
                      text: context.localizations.signUp,
                      textColor: Colors.deepOrangeAccent,
                      buttonColor: Colors.white,
                      onBottomSheetButtonPressed: authLogic.onSignUpPressed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
