import 'package:flutter/material.dart';
import 'package:meet_up_app/data/service/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/internal/routes.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/home_drawer/add_photo_button.dart';
import 'package:meet_up_app/presentation/components/home_drawer/drawer_tile.dart';
import 'package:meet_up_app/presentation/components/logInAndSignUpButtons.dart';
import 'package:meet_up_app/utils/app_icons.dart';

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
        child: AuthService.instance.isUserAnonymousOrNull
            ? const LogInAndSignUpButtons()
            : Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const AddPhotoButton(),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("NAME"),
                        ),
                        const SizedBox(height: 20),
                        DrawerTile(
                          onTap: () => Routes.instance.navigateTo(
                            Routes.instance.profile,
                            context,
                          ),
                          leading: AppIcons.profile.build(),
                          title: "Profile",
                        ),
                        DrawerTile(
                          onTap: () => Routes.instance.navigateTo(
                            Routes.instance.myMeetings,
                            context,
                          ),
                          leading: (AppIcons.calendar
                                ..color = const Color(0xff0d0d0d))
                              .build(),
                          title: "My meetings",
                        ),
                        const Divider(
                          indent: 16,
                          endIndent: 16,
                        ),
                        DrawerTile(
                          onTap: () => Routes.instance.navigateTo(
                            Routes.instance.settings,
                            context,
                          ),
                          leading: AppIcons.settings.build(),
                          title: "Settings",
                        ),
                        DrawerTile(
                          onTap: () => onLogOutPressed(
                            context: context,
                            authBloc: _authBloc,
                          ),
                          leading: AppIcons.logOut.build(),
                          title: "Log out",
                        ),
                      ],
                    ),
                    const Text("v 1.0.0"),
                  ],
                ),
              ),
      ),
    );
  }
}
