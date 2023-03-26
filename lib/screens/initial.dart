import 'package:app/screens/signin.dart';
import 'package:app/screens/signup.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    return Scaffold(
      backgroundColor: themeColor.primary,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Mental\n  Diary",
                    style: TextStyle(
                      color: themeColor.white.first,
                      fontFamily: 'Pacifico',
                      fontSize: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60.0,
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        //メールアドレスとパスワードを送る
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) {
                                return SigninPage();
                              }
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor.white.first,
                        foregroundColor: themeColor.primary,
                        fixedSize: const Size(200,40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      child: const Text('sign in'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        //メールアドレスとパスワードを送る
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignupPage();
                            }
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor.white.first,
                        foregroundColor: themeColor.primary,
                        fixedSize: const Size(200,40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      child: const Text('sign up'),
                    ),
                  ),
                ],
            ),
        ),
      ),
    );
  }
}