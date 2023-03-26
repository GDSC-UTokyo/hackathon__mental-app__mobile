import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart';
import 'package:provider/provider.dart';

class CreateReasonPage extends StatefulWidget {
  const CreateReasonPage({super.key});

  @override
  _CreateReasonPageState createState() => _CreateReasonPageState();
}

class _CreateReasonPageState extends State<CreateReasonPage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Create Reason'),
        backgroundColor: themeColor.primary,
      ),
    );
  }
}
