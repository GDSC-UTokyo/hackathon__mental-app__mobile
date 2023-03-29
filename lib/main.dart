import 'package:app/provider/reason.dart';
import 'package:app/provider/report.dart';
import 'package:app/provider/currentReport.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:app/app.dart";
import 'package:app/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<ReasonsProvider>(
          create: (BuildContext context) => ReasonsProvider(),
        ),
        ChangeNotifierProvider<CurrentReasonProvider>(
          create: (BuildContext context) => CurrentReasonProvider(),
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
