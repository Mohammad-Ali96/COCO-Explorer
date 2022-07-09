import 'package:flutter/material.dart';

abstract class AppColorScheme {
  Color get primaryColor;
  Color get secondaryColor;
  Color get accentColor => const Color(0xFF1E8D77);
  Color get errorColor => const Color(0xffDE0030);
  Color get placeholderColor;
  Color get inputBorderColor;
  Color get dividerColor;
  Color get primaryFontColor;
  Color get secondaryFontColor;
  Color get cardBackgroundColor;
  Color get backgroundColor;
  Color get iconTintColor;
  Color get buttonBackgroundColor;
  Color get buttonTextColor;
  Color get secondaryCardBackgroundColor;
  Color get infoTextColor;
}

class AppDarkColorScheme extends AppColorScheme {
  @override
  Color get backgroundColor => const Color(0xff121212);

  @override
  Color get buttonBackgroundColor => const Color(0xffFFFFFF);

  @override
  Color get buttonTextColor => const Color(0xff121212);

  @override
  Color get cardBackgroundColor => const Color(0xff1d1d1d);

  @override
  Color get secondaryCardBackgroundColor => Colors.transparent;

  @override
  Color get dividerColor => const Color(0xff454549);

  @override
  Color get iconTintColor => const Color(0xffffffff);

  @override
  Color get inputBorderColor => const Color(0xff4d4d4d);

  @override
  Color get placeholderColor => const Color(0xff3c3c3d);

  @override
  Color get primaryColor => const Color(0xFF121212);

  @override
  Color get primaryFontColor => const Color(0xffffffff);

  @override
  Color get secondaryColor => const Color(0xff1d1d1d);

  @override
  // Color get secondaryFontColor => const Color(0xff979797);
  Color get secondaryFontColor => const Color(0xffffffff);

  @override
  Color get infoTextColor => const Color(0xff979797);
}

class AppLightColorScheme extends AppColorScheme {
  @override
  Color get backgroundColor => const Color(0xffFFFFFF);

  @override
  Color get buttonBackgroundColor => const Color(0xff1E8D77);

  @override
  Color get buttonTextColor => const Color(0xffFFFFFF);

  @override
  Color get cardBackgroundColor => const Color(0xffF2F3F7);

  @override
  Color get secondaryCardBackgroundColor => Colors.transparent;

  @override
  Color get dividerColor => const Color(0xffE1E1E1);

  @override
  Color get iconTintColor => const Color(0xff000000);

  @override
  Color get inputBorderColor => const Color(0xffBBBBBB);

  @override
  Color get placeholderColor => const Color(0xffBBBBBB);

  @override
  Color get primaryColor => const Color(0xFFFFFFFF);

  @override
  Color get primaryFontColor => const Color(0xff20313B);

  @override
  Color get secondaryColor => const Color(0xffF2F3F7);

  @override
  Color get secondaryFontColor => const Color(0xff6A6A6A);

  @override
  Color get infoTextColor => const Color(0xff979797);
}
