import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_up_app/core/l10n/app_localizations_export.dart';
import 'package:meet_up_app/core/routes.dart';
import 'package:meet_up_app/core/theme/app_theme.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meet Up App',
        theme: LightTheme().theme,
        darkTheme: DarkTheme().theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: Routes.routes,
        initialRoute: Routes.initialRoute,
        onGenerateRoute: Routes.onGenerateRoute,
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
    );
  }
}
