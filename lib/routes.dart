import 'package:flutter/material.dart';
import 'package:kurbandas/screens/home_page.dart';

import 'screens/auth/login_page.dart';

class Routes {
  Routes();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String home = "/home", login = "/login";

  Route onGenerateRoute(RouteSettings settings) {
    Widget page = const Scaffold(
      body: Center(
        child: Text("Page Not Found"),
      ),
    );

    switch (settings.name) {
      case Routes.home:
        page = const HomePage();
        break;
      case Routes.login:
        page = const LoginPage();
        break;
    }

    return MaterialPageRoute(builder: (context) => page);
  }

  static Future navigateAndRemoveUntil(String routeName) =>
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(routeName, (route) => false);
}
