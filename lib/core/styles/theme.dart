import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/styles/font_family.dart';

ThemeData buildLightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: ColorsManager.primaryColor,
    scaffoldBackgroundColor: ColorsManager.whiteColor,
    cardColor: ColorsManager.whiteColor,
    appBarTheme: _buildAppBarTheme(context),
    textTheme: _buildTextTheme(context),
    fontFamily: FontFamilyHelper.standardFont,
  );
}

TextTheme _buildTextTheme(BuildContext context) {
  return TextTheme(
    headlineLarge: StyleManager.headlineLarge(context),
    headlineMedium: StyleManager.headlineMedium(context),
    headlineSmall: StyleManager.headlineSmall(context),
    titleLarge: StyleManager.titleLarge(context),
    titleMedium: StyleManager.titleMedium(context),
    titleSmall: StyleManager.titleSmall(context),
    labelLarge: StyleManager.labelLarge(context),
    labelMedium: StyleManager.labelMedium(context),
    labelSmall: StyleManager.labelSmall(context),
    bodyLarge: StyleManager.bodyLarge(context),
  );
}

AppBarTheme _buildAppBarTheme(BuildContext context) {
  return AppBarTheme(
    color: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ColorsManager.blackPrimary,
      systemNavigationBarDividerColor: ColorsManager.whiteColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
}
