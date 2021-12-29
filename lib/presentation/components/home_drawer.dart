import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_up_app/data/service/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/button_icon.dart';
import 'package:meet_up_app/presentation/components/logInAndSignUpButtons.dart';
import 'package:meet_up_app/utils/log.dart';

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
    Log.message(
        _tag, "isUserAnonymous ${AuthService.instance.isUserAnonymousOrNull}");
    Log.message(_tag, FirebaseAuth.instance.currentUser.toString());
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SafeArea(
        child: AuthService.instance.isUserAnonymousOrNull
            ? const LogInAndSignUpButtons()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: ButtonIcon(
                        icon: const Icon(Icons.exit_to_app_rounded),
                        onPressed: () => onLogOutPressed(
                          context: context,
                          authBloc: _authBloc,
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
