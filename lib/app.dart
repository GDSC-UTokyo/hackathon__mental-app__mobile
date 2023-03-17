import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/home/home.dart';
import 'package:app/screens/home/unknown.dart';

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
            '/': (_) => const MaterialPage(child: HomePage()),
          },
        ),
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
