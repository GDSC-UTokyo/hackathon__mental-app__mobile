import 'package:app/provider/reason.dart';
import 'package:app/screens/reason.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart';
import 'package:provider/provider.dart';

class EditReasonPage extends StatefulWidget {
  const EditReasonPage({super.key});

  @override
  _EditReasonPageState createState() => _EditReasonPageState();
}

class _EditReasonPageState extends State<EditReasonPage> {
  String currentReason = '';
  String message = '';

  @override
  void initState() {
    super.initState();

    currentReason = context.read<CurrentReasonProvider>().reason.reason;
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;
    final id = context.read<CurrentReasonProvider>().reason.id;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Edit Reason'),
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
                initialValue: currentReason,
                decoration: InputDecoration(
                  fillColor: themeColor.white[1],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.green,
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
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.5,
                    ),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    currentReason = value;
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
                  if (currentReason == '') {
                    setState(() {
                      message = 'reason column is empty';
                    });
                  } else {
                    context.read<ReasonsProvider>().create(Reason(id, currentReason));
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
                  backgroundColor: Colors.green,
                  foregroundColor: themeColor.white.first,
                  fixedSize: const Size(200,40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                child: const Text('edit'),
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
