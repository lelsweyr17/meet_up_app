import 'package:flutter/material.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/app_bars.dart';

class MyMeetingsPage extends StatelessWidget {
  const MyMeetingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.instance.transparentAppBarWithBlackStatusBar(
        title: AppLocalizations.of(context)!.myMeetings,
      ),
    );
  }
}
