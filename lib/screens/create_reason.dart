import 'dart:math';

import 'package:app/provider/reason.dart';
import 'package:app/screens/reason.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart';
import 'package:provider/provider.dart';

class CreateReasonPage extends StatefulWidget {
  const CreateReasonPage({super.key});

  @override
  _CreateReasonPageState createState() => _CreateReasonPageState();
}

class _CreateReasonPageState extends State<CreateReasonPage> {
  String newReason = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Create Reason'),
        backgroundColor: themeColor.primary,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: themeColor.white[1],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: themeColor.primary,
                      width: 3.0,
                    ),
                  ),
                  labelText: 'reason',
                  labelStyle: TextStyle(
                    color: themeColor.black,
                  ),
                  floatingLabelStyle: const TextStyle(fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: themeColor.primary,
                      width: 1.5,
                    ),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    newReason = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (newReason == '') {
                    setState(() {
                      message = 'reason column is empty';
                    });
                  } else {
                    final id = Random().nextInt(10000000).toString();
                    context.read<ReasonsProvider>().create(Reason(id, newReason));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const ReasonPage();
                        }
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor.primary,
                  foregroundColor: themeColor.white.first,
                  fixedSize: const Size(200,40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                child: const Text('create'),
              ),
            ),
            Text(
              message,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        )
      ),
    );
  }
}
