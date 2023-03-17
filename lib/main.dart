import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:app/app.dart";
import 'package:app/theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
