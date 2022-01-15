// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meet_up_app/presentation/components/buttons/button.dart';
import 'package:meet_up_app/presentation/pages/start_page.dart';

Widget makeTestableWidget({
  required Widget child,
  Locale locale = const Locale("en"),
}) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: locale,
    home: child,
  );
}

void main() async {
  group("Start page tests", () {
    testWidgets('Widgets exist in RU', (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          child: const StartPage(),
          locale: Locale("ru"),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("See ya"), findsOneWidget);
      expect(find.widgetWithText(Button, "Вход"), findsOneWidget);
      expect(find.widgetWithText(Button, "Регистрация"), findsOneWidget);
    });

    testWidgets('Widgets exist in EN', (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestableWidget(child: const StartPage()),
      );
      await tester.pumpAndSettle();

      expect(find.text("See ya"), findsOneWidget);
      expect(find.widgetWithText(Button, "Log In"), findsOneWidget);
      expect(find.widgetWithText(Button, "Sign Up"), findsOneWidget);
    });
  });
}
