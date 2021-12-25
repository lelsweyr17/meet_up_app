import 'package:flutter/material.dart';
import 'package:meet_up_app/data/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/presentation/pages/home_page.dart';
import 'package:meet_up_app/presentation/pages/login_page.dart';
import 'package:meet_up_app/presentation/pages/sign_up_page.dart';
import 'package:meet_up_app/presentation/pages/start_page.dart';
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

  final routes = {
    "/start": (context) => const StartPage(),
    "/home": (context) => const HomePage(),
    "/login": (context) => const LoginPage(),
    "/signUp": (context) => const SignUpPage(),
  };

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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
        initialRoute: "/start",
      ),
    );
  }
}
