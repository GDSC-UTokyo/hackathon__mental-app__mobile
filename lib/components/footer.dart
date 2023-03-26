import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Footer extends StatefulWidget {
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State {
  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;
    // ToDo: ページ遷移を実装する
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'home',
          backgroundColor: themeColor.primary,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.history_edu),
          label: 'log',
          backgroundColor: themeColor.primary,
        ),
      ],
    );
  }
}