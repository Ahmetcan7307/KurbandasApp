import 'package:flutter/material.dart';
import 'package:kurbandas/screens/home_page.dart';
import 'package:kurbandas/screens/kurban/create/create_kurban_page.dart';
import 'package:kurbandas/screens/kurban/edit_kurban_page.dart';
import 'package:kurbandas/screens/kurban/kurban_detail_page.dart';
import 'package:kurbandas/screens/profile/about_page.dart';
import 'package:kurbandas/screens/profile/help_page.dart';
import 'package:kurbandas/screens/profile/kurban_requests_page.dart';
import 'package:kurbandas/screens/profile/settings_page.dart';

import 'screens/auth/login_page.dart';
import 'screens/profile/profile_page.dart';

class Routes {
  Routes();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String home = "/home",
      login = "/login",
      profile = "/profile",
      settings = "/settings",
      kurbanRequests = "/kurbanRequests",
      kurbanDetail = "/kurbanDetail",
      createKurban = "/createKurban",
      editKurban = "/editKurban",
      about = "/about",
      help = "/help";

  Route onGenerateRoute(RouteSettings settings) {
    Widget page = const Scaffold(
      body: Center(
        child: Text("Page Not Found"),
      ),
    );

    switch (settings.name) {
      case Routes.home:
        page = HomePage();
        break;
      case Routes.login:
        page = const LoginPage();
        break;
      case Routes.profile:
        page = ProfilePage();
        break;
      case Routes.settings:
        page = SettingsPage();
        break;
      case Routes.kurbanRequests:
        page = KurbanRequestsPage();
        break;
      case Routes.kurbanDetail:
        page = KurbanDetailPage();
        break;
      case Routes.createKurban:
        page = CreateKurbanPage();
        break;
      case Routes.editKurban:
        page = EditKurbanPage();
        break;
      case Routes.about:
        page = AboutPage();
        break;
      case Routes.help:
        page = HelpPage();
        break;
    }

    return MaterialPageRoute(builder: (context) => page);
  }

  static Future navigateAndRemoveUntil(String routeName) =>
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(routeName, (route) => false);
}
