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
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ThemeApp.blackPrimary,
        systemNavigationBarColor: ThemeApp.blackPrimary,
        systemNavigationBarDividerColor: ThemeApp.secondaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: blackPrimary,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 30.sp,
        color: blackPrimary,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 25.sp,
        color: blackPrimary,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 22.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.roboto(
        fontSize: 17.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 14.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.roboto(
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
    appBarTheme: const AppBarTheme(
        ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: blackPrimary,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 30.sp,
        color: blackPrimary,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 25.sp,
        color: blackPrimary,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 22.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.roboto(
        fontSize: 17.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 14.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 12.sp,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
