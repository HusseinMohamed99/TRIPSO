import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static const primaryColor = Color.fromARGB(255, 87, 199, 223);
  static const secondaryColor = Color.fromARGB(255, 255, 255, 255);
  static const blackPrimary = Color.fromARGB(255, 0, 0, 0);
  static const yellowColor = Color.fromARGB(255, 255, 255, 0);
  static const blueColor = Color.fromARGB(255, 68, 138, 255);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    cardColor: secondaryColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: secondaryColor,
        systemNavigationBarColor: secondaryColor,
        systemNavigationBarDividerColor: secondaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: blackPrimary,
      ),
      headline2: GoogleFonts.roboto(
        fontSize: 30.sp,
        color: blackPrimary,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.roboto(
        fontSize: 25.sp,
        color: blackPrimary,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.roboto(
        fontSize: 22.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.roboto(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      headline6: GoogleFonts.roboto(
        fontSize: 17.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: GoogleFonts.roboto(
        fontSize: 14.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: GoogleFonts.roboto(
        fontSize: 12.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    cardColor: secondaryColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: secondaryColor,
        systemNavigationBarColor: secondaryColor,
        systemNavigationBarDividerColor: secondaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: blackPrimary,
      ),
      headline2: GoogleFonts.roboto(
        fontSize: 30.sp,
        color: blackPrimary,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.roboto(
        fontSize: 25.sp,
        color: blackPrimary,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.roboto(
        fontSize: 22.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.roboto(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      headline6: GoogleFonts.roboto(
        fontSize: 17.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: GoogleFonts.roboto(
        fontSize: 14.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: GoogleFonts.roboto(
        fontSize: 12.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
