import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_up_app/utils/gradients.dart';
import 'package:meet_up_app/utils/shadows.dart';

class AppBars {
  const AppBars._create();

  static const AppBars _instance = AppBars._create();

  static AppBars get instance => _instance;

  PreferredSizeWidget transparentAppBarWithWhiteStatusBar({
    List<Widget> actions = const [],
    String title = "",
  }) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.orange,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      actions: actions,
    );
  }

  PreferredSizeWidget transparentAppBarWithBlackStatusBar({
    List<Widget> actions = const [],
    String title = "",
  }) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.orange,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      actions: actions,
    );
  }

  PreferredSizeWidget appBarWithBlackStatusBarForGradient() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  SliverAppBar sliverAppBarWithGradient({
    required double size,
    Widget? child,
    List<Widget>? actions,
    String title = "",
  }) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      primary: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: const _GradientAppBarContainer(),
      actions: actions,
      title: Text(title),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(size),
        child: child!,
      ),
    );
  }

  SliverAppBar transparentSliverAppBar({
    Widget? leading,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
  }) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      leading: leading,
      actions: actions,
      bottom: bottom,
    );
  }
}

class _GradientAppBarContainer extends StatelessWidget {
  const _GradientAppBarContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

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
