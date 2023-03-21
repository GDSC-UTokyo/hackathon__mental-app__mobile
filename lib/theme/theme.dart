import 'package:flutter/material.dart';
import 'color.dart';
import 'text.dart';

class ThemeProvider with ChangeNotifier {
  AppTheme get theme => AppTheme.light();
}

class AppTheme {
  AppTheme({
    required this.themeMode,
    required this.themeData,
    required this.textTheme,
    required this.colorTheme,
  });

  factory AppTheme.light() {
    const themeMode = ThemeMode.light;
    final colorTheme = AppColorTheme.light();
    // final constantsTheme = AppConstantsTheme.light();
    final textTheme = AppTextTheme(colorTheme);
    final themeData = ThemeData.light().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: colorTheme.background,
      primaryColor: colorTheme.primary,
      primaryColorLight: colorTheme.secondary,
      appBarTheme: AppBarTheme(
        color: colorTheme.background,
        titleTextStyle: TextStyle(color: colorTheme.text),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: colorTheme.secondaryTransparent,
        backgroundColor: colorTheme.background,
        surfaceTintColor: colorTheme.white[0],
        shadowColor: colorTheme.primary,
        labelTextStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.any(
              {
                MaterialState.selected,
              }.contains,
            )) {
              return textTheme.regular;
            }
            return textTheme.regular.textColor(colorTheme.grey[1]);
          },
        ),
      ),
      textTheme: ThemeData.light().textTheme,
    );
    return AppTheme(
      themeMode: themeMode,
      themeData: themeData,
      textTheme: AppTextTheme(colorTheme),
      colorTheme: colorTheme,
    );
  }

  final ThemeMode themeMode;
  final ThemeData themeData;
  final AppTextTheme textTheme;
  final AppColorTheme colorTheme;
}
