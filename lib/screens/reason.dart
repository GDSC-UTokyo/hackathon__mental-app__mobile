import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart';
import 'package:provider/provider.dart';

class ReasonPage extends StatefulWidget {
  const ReasonPage({super.key});

  @override
  _ReasonPageState createState() => _ReasonPageState();
}

class _ReasonPageState extends State<ReasonPage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Reason'),
        backgroundColor: themeColor.primary,
      ),
    );
  }
}
