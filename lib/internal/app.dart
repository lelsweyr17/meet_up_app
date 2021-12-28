import 'package:flutter/material.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/internal/routes.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    final authBloc = AuthBloc();

    _authBloc = authBloc;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBloc>(
          create: (_) => _authBloc,
          dispose: (_, it) => it.dispose(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meet Up App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: Routes.instance.routes,
        initialRoute: Routes.instance.initialRoute,
      ),
    );
  }
}
