import 'package:flutter/material.dart';
import 'package:meet_up_app/internal/providers.dart';
import 'package:meet_up_app/internal/routes.dart';
import 'package:meet_up_app/internal/theme/dark_theme.dart';
import 'package:meet_up_app/internal/theme/light_theme.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.instance.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meet Up App',
        theme: LightTheme().theme,
        darkTheme: DarkTheme().theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: Routes.instance.routes,
        initialRoute: Routes.instance.initialRoute,
      ),
    );
  }
}
