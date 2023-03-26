import 'package:app/provider/reason.dart';
import 'package:app/provider/report.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:app/app.dart";
import 'package:app/theme/theme.dart';
import 'config/config.dart';

final configurations = Configurations();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: configurations.apiKey,
      authDomain: configurations.authDomain,
      projectId: configurations.projectId,
      storageBucket: configurations.storageBucket,
      messagingSenderId: configurations.messagingSenderId,
      appId: configurations.appId,
      measurementId: configurations.measurementId,
    )
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<ReasonsProvider>(
          create: (BuildContext context) => ReasonsProvider(),
        ),
        ChangeNotifierProvider<ReportsProvider>(
          create: (BuildContext context) => ReportsProvider(),
        ),
        ChangeNotifierProvider<CurrentReportProvider>(
          create: (BuildContext context) => CurrentReportProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
