import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart';
import 'package:provider/provider.dart';

class EditReasonPage extends StatefulWidget {
  const EditReasonPage({super.key});

  @override
  _EditReasonPageState createState() => _EditReasonPageState();
}

class _EditReasonPageState extends State<EditReasonPage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Edit Reason'),
        backgroundColor: themeColor.primary,
      ),
    );
  }
}
