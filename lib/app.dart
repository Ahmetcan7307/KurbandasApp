import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.light,
              primary: Colors.green,
              secondary: Colors.amber),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light),
          ),
          cardTheme: CardThemeData(
            elevation: 2,
            margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.green, width: 2)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
          tabBarTheme: const TabBarThemeData(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
          ),
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
