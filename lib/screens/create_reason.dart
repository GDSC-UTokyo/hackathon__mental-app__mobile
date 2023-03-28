import 'dart:convert';
import 'dart:math';

import 'package:app/api/entity/reason/reason_entity.dart';
import 'package:app/api/service/reason_service.dart';
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
                onPressed: () async {
                  if (newReason == '') {
                    setState(() {
                      message = 'reason column is empty';
                    });
                  } else {
                    try {
                      final response = await ReasonService().create(newReason);

                      final data = ReasonEntity.fromJson(json.decode(response.body));

                      if (!mounted) return;

                      context.read<ReasonsProvider>().create(Reason(data.id, data.reason));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ReasonPage();
                          }
                        ),
                      );
                    } catch(e) {
                      print(e);
                      setState(() {
                        message = 'failed in creating reasons';
                      });

                    }
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
