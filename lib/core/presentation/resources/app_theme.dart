import 'dart:math';

import 'package:coco_explorer/core/presentation/resources/app_color_scheme.dart';
import 'package:flutter/material.dart';


class AppTheme {
  final AppColorScheme appColorScheme;

  AppTheme(this.appColorScheme);

  ThemeData getThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: _generateMaterialColor(),
      scaffoldBackgroundColor: appColorScheme.backgroundColor,
      backgroundColor: appColorScheme.backgroundColor,
      cardColor: appColorScheme.cardBackgroundColor,
      canvasColor: appColorScheme.cardBackgroundColor,
      focusColor: appColorScheme.infoTextColor,
      errorColor: appColorScheme.errorColor,
      dividerColor: appColorScheme.dividerColor,
      hintColor: appColorScheme.placeholderColor,
      indicatorColor: appColorScheme.accentColor,
      toggleableActiveColor: appColorScheme.accentColor,
      disabledColor: appColorScheme.placeholderColor,
      dialogTheme: DialogTheme(backgroundColor: appColorScheme.backgroundColor),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: appColorScheme.backgroundColor),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appColorScheme.accentColor,
      ),
      iconTheme: IconThemeData(color: appColorScheme.iconTintColor),
      primaryIconTheme: IconThemeData(color: appColorScheme.iconTintColor),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: appColorScheme.accentColor,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(color: appColorScheme.primaryFontColor),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: appColorScheme.primaryFontColor,
            bodyColor: appColorScheme.secondaryFontColor,
          ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: appColorScheme.placeholderColor),
        hintStyle: TextStyle(color: appColorScheme.placeholderColor),
        fillColor: appColorScheme.cardBackgroundColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColorScheme.accentColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(13))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColorScheme.inputBorderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(13))),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColorScheme.inputBorderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(13))),
        contentPadding: const EdgeInsets.all(14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          overlayColor: MaterialStateProperty.all(
              appColorScheme.buttonTextColor.withAlpha(50)),
          foregroundColor:
              MaterialStateProperty.all(appColorScheme.buttonTextColor),
          backgroundColor:
              MaterialStateProperty.all(appColorScheme.buttonBackgroundColor),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          )),
          textStyle: MaterialStateProperty.all(TextStyle(
            color: appColorScheme.buttonTextColor,
            fontSize: 16,
          )),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          overlayColor: MaterialStateProperty.all(
              appColorScheme.accentColor.withAlpha(50)),
          foregroundColor:
              MaterialStateProperty.all(appColorScheme.accentColor),
          backgroundColor:
              MaterialStateProperty.all(appColorScheme.cardBackgroundColor),
          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(
              BorderSide(color: appColorScheme.accentColor)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: appColorScheme.accentColor),
            borderRadius: BorderRadius.circular(13),
          )),
          textStyle: MaterialStateProperty.all(TextStyle(
            color: appColorScheme.accentColor,
            fontSize: 16,
          )),
        ),
      ),
      unselectedWidgetColor: appColorScheme.infoTextColor,
    );
  }

  MaterialColor _generateMaterialColor() {
    return MaterialColor(appColorScheme.primaryColor.value, {
      50: _tintColor(appColorScheme.secondaryColor, 0.9),
      100: _tintColor(appColorScheme.secondaryColor, 0.8),
      200: _tintColor(appColorScheme.secondaryColor, 0.6),
      300: _tintColor(appColorScheme.secondaryColor, 0.4),
      400: _tintColor(appColorScheme.secondaryColor, 0.2),
      500: appColorScheme.accentColor,
      600: _shadeColor(appColorScheme.primaryColor, 0.1),
      700: _shadeColor(appColorScheme.primaryColor, 0.2),
      800: _shadeColor(appColorScheme.primaryColor, 0.3),
      900: _shadeColor(appColorScheme.primaryColor, 0.4),
    });
  }

  int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}

ThemeData getDatePickerTheme(context) {
  return Theme.of(context).copyWith(
    colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Theme.of(context).colorScheme.secondary,
        onSurface: Theme.of(context).textTheme.bodyText1!.color),
  );
}
