import 'package:flutter/material.dart';

import 'authorization_bottom_sheet_content.dart';
import 'button.dart';

class ButtonWithBottomSheetOnTap extends StatelessWidget {
  const ButtonWithBottomSheetOnTap({
    Key? key,
    required this.text,
    required this.onBottomSheetButtonPressed,
    this.isOutlined = false,
    this.textColor,
    this.buttonColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onBottomSheetButtonPressed;
  final bool isOutlined;
  final Color? textColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        text: text,
        isOutlined: isOutlined,
        textColor: textColor,
        buttonColor: buttonColor,
        onPressed: () => showBottomSheet(
          context,
          AuthorizationBottomSheetContent(
            buttonText: text,
            onButtonPressed: onBottomSheetButtonPressed,
          ),
        ),
      ),
    );
  }

  void showBottomSheet(
    BuildContext context,
    Widget child,
  ) {
    Scaffold.of(context).showBottomSheet(
      (context) => child,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
    );
  }
}
