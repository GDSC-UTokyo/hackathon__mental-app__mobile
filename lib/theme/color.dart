import 'package:flutter/material.dart';

class AppColorTheme {

  const AppColorTheme({
    required this.primary,
    required this.secondary,
    required this.secondaryTransparent,
    required this.background,
    required this.white,
    required this.grey,
    required this.text,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.lime,
    required this.green,
    required this.paleBlue,
    required this.blue,
    required this.indigo,
    required this.purple,
    required this.pink,
    required this.error,
    required this.black,
  });

  factory AppColorTheme.light() {
    return AppColorTheme(
      primary: const Color(0xffA0EEFE),
      secondary: const Color(0xffF8C2C0),
      secondaryTransparent: const Color(0xffF8C2C0).withOpacity(0.12),
      background: const Color(0xffEFEFEF),
      white: const [Color(0xffFFFFFF), Color(0xffFCFCFC), Color(0xffF0F0F0)],
      grey: const [
        Color(0xffB6B6B6),
        Color(0xff9F9F9F),
        Color(0xff898989),
        Color(0xff737373),
        Color(0xff5E5E5E)
      ],
      text: const Color(0xff373737),
      red: const Color(0xffFFB9B8),
      orange: const Color(0xffFFD4B7),
      yellow: const Color(0xffFFFFB5),
      lime: const Color(0xffEAFFB6),
      green: const Color(0xffBDFFB6),
      paleBlue: const Color(0xffB7F2FF),
      blue: const Color(0xffB8DEFF),
      indigo: const Color(0xffB9BFFF),
      purple: const Color(0xffE4B7FF),
      pink: const Color(0xffFFB8E6),
      error: const Color(0xffBF3130),
      black: const Color(0xff000000),
    );
  }

  final Color primary;
  final Color secondary;
  final Color secondaryTransparent;
  final Color background;
  final Color text;
  final List<Color> white;
  final List<Color> grey;
  final Color red;
  final Color orange;
  final Color yellow;
  final Color lime;
  final Color green;
  final Color paleBlue;
  final Color blue;
  final Color indigo;
  final Color purple;
  final Color pink;
  final Color error;
  final Color black;
}
