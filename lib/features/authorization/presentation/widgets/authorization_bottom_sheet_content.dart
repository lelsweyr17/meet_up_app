import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:meet_up_app/features/authorization/presentation/logic/authorization_logic.dart';
import 'package:meet_up_app/features/authorization/presentation/widgets/bottom_sheet_drag_indicator.dart';
import 'package:meet_up_app/core/utils/context_helper.dart';
import 'package:provider/provider.dart';

import 'button.dart';
import 'login_text_field.dart';

class AuthorizationBottomSheetContent extends StatefulWidget {
  const AuthorizationBottomSheetContent({
    Key? key,
    required this.buttonText,
    required this.onButtonPressed,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onButtonPressed;

  @override
  State<AuthorizationBottomSheetContent> createState() =>
      _AuthorizationBottomSheetContentState();
}

class _AuthorizationBottomSheetContentState
    extends State<AuthorizationBottomSheetContent> {
  AuthorizationLogic get _authLogic => context.read();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetDragIndicator(),
            const SizedBox(height: 48),
            LoginTextField(
              keyBoardType: TextInputType.emailAddress,
              autofocus: true,
              textInputAction: TextInputAction.next,
              hintText: context.localizations.enterYourEmail,
              obscure: false,
              onChanged: _authLogic.updateLogin,
            ),
            const SizedBox(height: 16),
            LoginTextField(
              keyBoardType: TextInputType.visiblePassword,
              hintText: context.localizations.enterYourPassword,
              obscure: true,
              onChanged: _authLogic.updatePassword,
            ),
            const SizedBox(height: 30),
            Button(
              text: widget.buttonText,
              buttonColor: Colors.black,
              onPressed: widget.onButtonPressed,
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
