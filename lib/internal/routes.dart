import 'package:flutter/material.dart';
import 'package:meet_up_app/presentation/pages/create_meeting_page.dart';
import 'package:meet_up_app/presentation/pages/home_page.dart';
import 'package:meet_up_app/presentation/pages/login_page.dart';
import 'package:meet_up_app/presentation/pages/my_meetings_page.dart';
import 'package:meet_up_app/presentation/pages/profile_page.dart';
import 'package:meet_up_app/presentation/pages/settings_page.dart';
import 'package:meet_up_app/presentation/pages/sign_up_page.dart';
import 'package:meet_up_app/presentation/pages/start_page.dart';
import 'package:meet_up_app/services/preferences_service.dart';
import 'package:meet_up_app/utils/animations.dart';
import 'package:meet_up_app/utils/log.dart';

const _tag = "routes";

class Routes {
  Routes._create() {
    Log.message(_tag, "_init");
  }

  static final Routes _instance = Routes._create();

  static Routes get instance => _instance;

  String get initialRoute => (PreferencesService.instance.isShowStartPage)
      ? Routes.instance.startPage
      : Routes.instance.homePage;

  Map<String, Widget Function(BuildContext)> get routes => {
        startPage: (context) => const StartPage(),
        homePage: (context) => const HomePage(),
        loginPage: (context) => const LoginPage(),
        signUpPage: (context) => const SignUpPage(),
        settings: (context) => const SettingsPage(),
        profile: (context) => const ProfilePage(),
        myMeetings: (context) => const MyMeetingsPage(),
        createMeeting: (context) => const CreateMeetingPage(),
      };

  String get startPage => "/start";

  String get homePage => "/home";

  String get loginPage => "/login";

  String get signUpPage => "/signUp";

  String get settings => "/settings";

  String get profile => "/profile";

  String get myMeetings => "/myMeetings";

  String get createMeeting => "createMeeting";

  void animatedNavigation({
    required BuildContext context,
    required Widget page,
  }) =>
      Navigator.of(context).push(Routes.instance.navigateWithAnimation(page));

  Route navigateWithAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (_, animation, __, child) {
        return slideTransitionFromBottom(
          animation: animation,
          child: child,
        );
      },
    );
  }
}
