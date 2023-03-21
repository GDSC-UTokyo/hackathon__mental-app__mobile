import 'package:flutter/material.dart';
import 'color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  const AppTextTheme._({
    required this.tiny,
    required this.small,
    required this.regular,
    required this.medium,
    required this.large,
    required this.extraLarge,
    required this.extraExtraLarge,
    required this.huge,
  });

  factory AppTextTheme(AppColorTheme colorTheme) {
    const normalRegular = TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: 'NotoSansJP',
    );
    return AppTextTheme._(
      tiny: TextStyle(
        fontSize: 8,
        color: colorTheme.text,
      ).merge(normalRegular),
      small: TextStyle(
        fontSize: 10,
        color: colorTheme.text,
      ).merge(normalRegular),
      regular: TextStyle(
        fontSize: 12,
        color: colorTheme.text,
      ).merge(normalRegular),
      medium: TextStyle(
        fontSize: 14,
        color: colorTheme.text,
      ).merge(normalRegular),
      large: TextStyle(
        fontSize: 20,
        color: colorTheme.text,
      ).merge(normalRegular),
      extraLarge: TextStyle(
        fontSize: 28,
        color: colorTheme.text,
      ).merge(normalRegular),
      extraExtraLarge: TextStyle(
        fontSize: 40,
        color: colorTheme.text,
      ).merge(normalRegular),
      huge: TextStyle(
        fontSize: 56,
        color: colorTheme.text,
      ).merge(normalRegular),
    );
  }

  final TextStyle tiny;
  final TextStyle small;
  final TextStyle regular;
  final TextStyle medium;
  final TextStyle large;
  final TextStyle extraLarge;
  final TextStyle extraExtraLarge;
  final TextStyle huge;
}

extension TextStyleExt on TextStyle {
  TextStyle bold() => copyWith(fontWeight: FontWeight.bold);
  TextStyle semiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle en() => GoogleFonts.roboto(textStyle: copyWith());
  TextStyle textColor(Color color) => copyWith(color: color);
}
