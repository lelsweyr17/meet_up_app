import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/app_bars.dart';
import 'package:meet_up_app/presentation/components/buttons/fab.dart';
import 'package:meet_up_app/presentation/components/home_drawer/home_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppLocalizations _localizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBars.instance.appBarWithWhiteStatusBarAndSearch(),
        drawer: const HomeDrawer(),
        floatingActionButton: Fab(onTap: onTap),
      ),
    );
  }

  void onTap() {
    // create new meeting
  }
}
