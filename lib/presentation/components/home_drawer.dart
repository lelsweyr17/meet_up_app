import 'package:flutter/material.dart';
import 'package:meet_up_app/data/service/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/button.dart';
import 'package:meet_up_app/presentation/components/logInAndSignUpButtons.dart';

const _tag = "home_drawer";

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  late final AppLocalizations _localizations;
  late final AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (AuthService.instance.isUserAnonymous)
              const LogInAndSignUpButtons()
            else
              Button(
                text: AppLocalizations.of(context)!.logOut,
                onPressed: () => onLogOutPressed(
                  context: context,
                  authBloc: _authBloc,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
