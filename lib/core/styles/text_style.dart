part of './../helpers/export_manager/export_manager.dart';

abstract class StyleManager {
  Color get primaryColor => ColorsManager.primaryColor;
  Color get secondaryColor => ColorsManager.whiteColor;
  Color get blackPrimary => ColorsManager.blackPrimary;
  Color get blueColor => ColorsManager.blueColor;
  Color get yellowColor => ColorsManager.yellowColor;

  static TextStyle headlineLarge(context) {
    return TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s32),
      height: 1.125.h,
    );
  }

  static TextStyle headlineMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s30),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.13.h,
    );
  }

  static TextStyle headlineSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s28),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.14.h,
    );
  }

  static TextStyle titleLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s24),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.17.h,
    );
  }

  static TextStyle titleMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s20),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.2.h,
    );
  }

  static TextStyle titleSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s18),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.22.h,
    );
  }

  static TextStyle labelLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s16),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.25.h,
    );
  }

  static TextStyle labelMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s14),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.28.h,
    );
  }

  static TextStyle labelSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s12),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.33.h,
    );
  }

  static TextStyle bodyLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s10),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.4.h,
    );
  }
}
