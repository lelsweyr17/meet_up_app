import 'package:flutter/material.dart';
import 'package:meet_up_app/data/service/auth_service.dart';
import 'package:meet_up_app/internal/routes.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/button.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Button(
              text: AppLocalizations.of(context)!.logOut,
              onPressed: () => onLogOutPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  void onLogOutPressed(BuildContext context) {
    AuthService.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.instance.startPage,
      (route) => false,
    );
  }
}
