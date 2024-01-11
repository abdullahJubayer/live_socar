import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    //Light Theme
    AppTheme.light: ThemeData.light().copyWith(
        colorScheme: _lightColorScheme,
        iconTheme: const IconThemeData(),
        dividerColor: CustomColors.dividerDark,
        primaryIconTheme: const IconThemeData(),
        scaffoldBackgroundColor: CustomColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.secondary,
          ),
        ),
        appBarTheme: const AppBarTheme().copyWith(
            elevation: 1,
            color: CustomColors.primary,
            iconTheme: const IconThemeData(color: Colors.white),
            actionsIconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        cardColor: Colors.white,
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)))),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(CustomColors.primary),
          trackColor: MaterialStateProperty.all(CustomColors.primary),
        )),

    //Dark Theme
    AppTheme.dark: ThemeData.dark().copyWith(
      colorScheme: _darkColorScheme,
      iconTheme: const IconThemeData().copyWith(color: Colors.white),
      dividerColor: CustomColors.dividerLight,
      primaryIconTheme: const IconThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.secondary,
        ),
      ),
      appBarTheme: const AppBarTheme().copyWith(
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.white),
          actionsIconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)))),
    ),
  };
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

class CustomColors {
  static const background = Color(0xffF2F7FA);
  static const primary = Color(0xff143F6C);
  static const secondary = Color(0xff134D86);
  static const error = Color(0xffFF0000);
  static const shadow = Color(0xffF8F7F7);
  static const outline = Color(0xffB8B5BC);
  static const outlineVariant = Color(0xff7C7575);

  static const lightBlue = Color(0xffe4f5ed);

  // static const appBackground = Color(0xFFF2F7FA);
  static const appBackground = Color(0xFFF6F6F6);
  static const topBackground = Color(0xFFEFEFEF);
  static const topBackgroundDark = Color(0xFF151026);
  static const roundIconBackground = Color(0xFF585AF9);
  static const dividerDark = Colors.black;
  static const dividerLight = Colors.white;
  static const lightGrey = Color(0xffF3F2F2);
  static const button = Color(0xffF8B335);
  static const shimmerBase = Color(0xFFEBEBF4);
  static const shimmerHighlight = Color(0xFFF4F4F4);
  static const booked = Color(0xFFD63276);
  static const busInfoCard = Color(0xFFF9F5F5);
}

class CustomSpacing {
  static const xSmall = 4.0;
  static const small = 8.0;
  static const medium = 16.0;
  static const large = 32.0;
  static const xLarge = 64.0;

  static SizedBox verticalSpace({double space = medium}) {
    return SizedBox(
      height: space,
    );
  }

  static SizedBox horizontalSpace({double space = medium}) {
    return SizedBox(
      width: space,
    );
  }
}

enum AppTheme {
  light,
  dark,
}

extension AppThemeExtension on AppTheme {
  String get text {
    switch (this) {
      case AppTheme.light:
        return 'light';
      case AppTheme.dark:
        return 'Dark';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case AppTheme.light:
        return Colors.white;
      case AppTheme.dark:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}

// --------------------------------------
// Color scheme
// --------------------------------------
ColorScheme _lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: CustomColors.primary,
    onPrimary: Colors.white,
    secondary: CustomColors.secondary,
    onSecondary: Colors.white,
    error: CustomColors.error,
    onError: Colors.white,
    background: CustomColors.background,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    shadow: CustomColors.shadow,
    outline: CustomColors.outline,
    outlineVariant: CustomColors.outlineVariant);

ColorScheme _darkColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: CustomColors.primary,
    onPrimary: Colors.white,
    secondary: CustomColors.secondary,
    onSecondary: Colors.white,
    error: CustomColors.error,
    onError: Colors.white,
    background: Colors.black54,
    onBackground: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
    shadow: CustomColors.shadow,
    outline: CustomColors.outline,
    outlineVariant: CustomColors.outlineVariant);
