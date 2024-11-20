import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';

ThemeData buildLightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: ColorsManager.primaryColor,
    scaffoldBackgroundColor: ColorsManager.secondaryColor,
    cardColor: ColorsManager.secondaryColor,
    appBarTheme: _buildAppBarTheme(context),
    textTheme: _buildTextTheme(context),
  );
}

TextTheme _buildTextTheme(BuildContext context) {
  return TextTheme(
    displayLarge: StyleManager.headlineLarge(context),
    displayMedium: StyleManager.headlineMedium(context),
    bodyLarge: StyleManager.bodyLarge(context),
    displaySmall: StyleManager.headlineSmall(context),
    titleLarge: StyleManager.titleLarge(context),
    titleMedium: StyleManager.titleMedium(context),
    titleSmall: StyleManager.titleSmall(context),
  );
}

AppBarTheme _buildAppBarTheme(BuildContext context) {
  return AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorsManager.primaryColor,
      systemNavigationBarColor: ColorsManager.blackPrimary,
      systemNavigationBarDividerColor: ColorsManager.secondaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
}
