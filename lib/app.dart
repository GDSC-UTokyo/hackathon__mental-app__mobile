import 'package:app/screens/initial.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/home/home.dart';
import 'package:app/screens/signin.dart';
import 'package:app/screens/signup.dart';
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
          },
        ),
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
