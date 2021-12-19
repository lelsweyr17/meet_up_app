import 'package:flutter/material.dart';
import 'package:meet_up_app/presentation/pages/home_page.dart';
import 'package:meet_up_app/presentation/pages/login_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final routes = {
    "/home": (context) => const HomePage(),
    "/login": (context) => const LoginPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: "/login",
    );
  }
}
