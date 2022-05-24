import 'package:flutter/material.dart';
import 'package:meet_up_app/features/authorization/presentation/pages/start_page.dart';

class Routes {
  const Routes._();

  static const startPage = "/start";

  // check user authentication
  static String get initialRoute => Routes.startPage;

  static Map<String, WidgetBuilder> get routes => {
        startPage: (_) => const StartPage(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startPage:
        return MaterialPageRoute(
          settings: settings,
          fullscreenDialog: true,
          builder: (_) => const StartPage(),
        );
    }
  }
}
