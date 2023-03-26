import 'package:app/screens/create_reason.dart';
import 'package:app/screens/edit_reason.dart';
import 'package:app/screens/initial.dart';
import 'package:app/screens/log.dart';
import 'package:app/screens/reason.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/signin.dart';
import 'package:app/screens/signup.dart';
import 'package:app/screens/create_report.dart';
import 'package:app/screens/edit_report.dart';
import 'package:app/screens/unknown.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) => RouteMap(
          onUnknownRoute: (path) =>
              const MaterialPage(child: UnknownPage()), //FIXME:
          routes: {
            '/': (_) => const MaterialPage(child: InitialPage()),
            '/home': (_) => const MaterialPage(child: HomePage()),
            '/signin': (_) => const MaterialPage(child: SigninPage()),
            '/signup': (_) => const MaterialPage(child: SignupPage()),
            '/log': (_) => const MaterialPage(child: LogPage()),
            '/report/create': (_) => const MaterialPage(child: CreateReportPage()),
            '/report/edit': (_) => const MaterialPage(child: EditReportPage()),
            '/reason': (_) => const MaterialPage(child: ReasonPage()),
            '/reason/create': (_) => const MaterialPage(child: CreateReasonPage()),
            '/reason/edit': (_) => const MaterialPage(child: EditReasonPage()),
          },
        ),
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
