import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kurbandas/app.dart';
import 'package:kurbandas/firebase_options.dart';
import 'package:kurbandas/injector.dart' as injector;
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: "assets/env");
  await Supabase.initialize(
      url: dotenv.env["supabaseUrl"]!, anonKey: dotenv.env["supabaseAnonKey"]!);
  await injector.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Provider(
    create: (context) => injector.serviceLocator.get<RootStore>(),
    child: App(),
  ));
}
