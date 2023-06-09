import 'package:app/screens/home.dart';
import 'package:app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/screens/signin.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = '';
  String password = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    InputDecoration signupInputDecoration(String labelText) {
      return InputDecoration(
        fillColor: themeColor.white[1],
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: themeColor.primary,
            width: 3.0,
          ),
        ),
        labelText: labelText,
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
      );
    }

    return Scaffold(
      backgroundColor: themeColor.background,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ),
                child: TextFormField(
                  decoration: signupInputDecoration('email'),
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: TextFormField(
                  decoration: signupInputDecoration('password'),
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      password = value;
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
                    try {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            }
                        ),
                      );
                    } catch (e) {
                      setState(() {
                        message = "failed in signup";
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor.primary,
                    foregroundColor: themeColor.white.first,
                    fixedSize: const Size(200, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  child: const Text('sign up'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: themeColor.background,
                    foregroundColor: themeColor.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const SigninPage();
                        }
                      ),
                    );
                  },
                  child: const Text(
                    'アカウントをお持ちの方のログインはこちら',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
