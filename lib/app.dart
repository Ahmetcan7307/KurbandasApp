import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kurbandas/core/utils/components/force_update.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';
import 'package:kurbandas/screens/splash/splash_page.dart';
import 'package:kurbandas/services/force_update_client.dart';
import 'package:kurbandas/stores/api/app_setting_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppSettingStore appSettingStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    appSettingStore = Provider.of<RootStore>(context).appSettingStore;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kurbandaş",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          buttonTheme: const ButtonThemeData(
              buttonColor: Colors.green, textTheme: ButtonTextTheme.primary)),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: WidgetsBinding.instance.platformDispatcher.locale,
      navigatorKey: Routes.navigatorKey,
      onGenerateRoute: Routes().onGenerateRoute,
      builder: (context, child) => ForceUpdate(
          navigatorKey: Routes.navigatorKey,
          client: ForceUpdateClient(
              fetchRequiredVersion: appSettingStore.getRequiredVersion),
          allowCancel: false,
          child: child!),
      home: const SplashPage(),
    );
  }
}
