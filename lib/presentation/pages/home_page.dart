import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:meet_up_app/internal/routes.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/app_bars.dart';
import 'package:meet_up_app/presentation/components/avatar.dart';
import 'package:meet_up_app/presentation/components/bottom_bar.dart';
import 'package:meet_up_app/presentation/components/buttons/fab.dart';
import 'package:meet_up_app/presentation/components/search_text_field.dart';
import 'package:meet_up_app/presentation/pages/profile_page.dart';
import 'package:meet_up_app/utils/app_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AppBars.instance.transparentSliverAppBar(
              leading: const _AvatarButton(),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: AppIcons.calendar.build(),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(150),
                child: Column(
                  children: const [
                    _SearchBoxWithTitleAndTextField(),
                    SizedBox(height: 16),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
        floatingActionButton: Fab(onTap: onFabPressed),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void onFabPressed() {
    // create new meeting
  }
}

class _AvatarButton extends StatelessWidget {
  const _AvatarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: const Avatar(size: 32),
      onPressed: () => Routes.instance.animatedNavigation(
        context: context,
        page: const ProfilePage(),
      ),
    );
  }
}

class _SearchBoxWithTitleAndTextField extends StatelessWidget {
  const _SearchBoxWithTitleAndTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.search,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SearchTextField(),
      ],
    );
  }
}
