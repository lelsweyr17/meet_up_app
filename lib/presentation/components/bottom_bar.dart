import 'package:flutter/material.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/utils/app_icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 20,
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: [
          _bottomBarItem(
            icon: AppIcons.calendar.build(),
            label: AppLocalizations.of(context)!.myMeetings,
          ),
          _bottomBarItem(
            icon: AppIcons.bookmark.build(),
            label: AppLocalizations.of(context)!.bookmarks,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomBarItem({
    required String label,
    required Widget icon,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: icon,
      ),
      label: label,
    );
  }
}
