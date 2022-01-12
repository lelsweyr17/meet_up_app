import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_up_app/presentation/components/search_text_field.dart';
import 'package:meet_up_app/utils/app_icons.dart';
import 'package:meet_up_app/utils/gradients.dart';
import 'package:meet_up_app/utils/shadows.dart';

class AppBars {
  const AppBars._create();

  static const AppBars _instance = AppBars._create();

  static AppBars get instance => _instance;

  PreferredSizeWidget transparentAppBarWithWhiteStatusBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.orange,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  PreferredSizeWidget transparentAppBarWithBlackStatusBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.orange,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  PreferredSizeWidget appBarWithBlackStatusBarForGradient() {
    return AppBar(
      foregroundColor: Colors.black,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  PreferredSizeWidget appBarWithWhiteStatusBarAndSearch() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(135),
      child: _GradientAppBarContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: (AppIcons.calendar..color = Colors.white).build(),
                ),
              ],
            ),
            const SearchTextField(),
          ],
        ),
      ),
    );
  }
}

class _GradientAppBarContainer extends StatelessWidget {
  const _GradientAppBarContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: Gradients.instance.yellowToRed(),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          Shadows.instance.black8(),
        ],
      ),
      child: child,
    );
  }
}
