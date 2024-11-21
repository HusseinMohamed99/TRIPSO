part of './../helpers/export_manager/export_manager.dart';

abstract class StyleManager {
  static TextStyle headlineLarge(context) {
    return TextStyle(
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s32),
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle headlineMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s30),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle headlineSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s28),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle titleLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s24),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle titleMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s20),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle titleSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s18),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle labelLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s16),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle labelMedium(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s14),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle labelSmall(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s12),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }

  static TextStyle bodyLarge(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s10),
      fontWeight: FontWeightHelper.regular,
      fontFamily: FontFamilyHelper.standardFont,
      color: ColorsManager.primaryColor,
    );
  }
}
