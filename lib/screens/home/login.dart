import 'package:app/theme/text.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    InputDecoration loginInputDecoration(String labelText){
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
                  decoration: loginInputDecoration('email'),
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
                  decoration: loginInputDecoration('password'),
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
                  bottom: 30.0,
                ),
                child: ElevatedButton(
                  onPressed: (){
                    //メールアドレスとパスワードを送る
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
                  child: const Text('sign in'),
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
                  onPressed: () {},
                  child: const Text(
                    'アカウントをお持ちでない方の登録はこちら',
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

class FlatButton {
}