part of './../helpers/export_manager/export_manager.dart';

abstract class StyleManager {
  static TextStyle headlineLarge(context) {
    return TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s32),
      height: 1.125.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle headlineMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s30),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.13.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle headlineSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s28),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.14.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle titleLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s24),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.17.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle titleMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s20),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.2.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle titleSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s18),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.22.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle labelLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s16),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.25.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle labelMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s14),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.28.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle labelSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s12),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.33.h,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle bodyLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s10),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      height: 1.4.h,
      color: ColorsManager.primaryColor,
    );
  }
}
