import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static const primaryColor = Color(0xff57C7DF);
  static const secondaryColor = Color(0xffFFFFFF);

  //static const Color darkPrimary = Color(0xff141A2E);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    // bottomSheetTheme: const BottomSheetThemeData(
    //     backgroundColor: Colors.white,
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(18), topRight: Radius.circular(18)))),
    cardColor: Colors.white,
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(
        fontSize: 35,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline2: GoogleFonts.roboto(
        fontSize: 30,
        color: Colors.black,
      ),
      headline3: GoogleFonts.roboto(
        fontSize: 25,
        color: Colors.black,
      ),
      headline4: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black,
      ),
      headline5: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black,
      ),
      headline6: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black,
      ),
      subtitle2: GoogleFonts.roboto(
        fontSize: 15,
        color: Colors.black,
      ),
    ),
  );

// static final ThemeData darkTheme = ThemeData(
//   scaffoldBackgroundColor: Colors.transparent,
//   primaryColor: darkPrimary,
//   accentColor: yellow,
//   bottomSheetTheme: const BottomSheetThemeData(
//       backgroundColor: darkPrimary,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(18), topRight: Radius.circular(18)))),
//   textTheme: const TextTheme(
//       headline6: TextStyle(
//         fontSize: 22,
//         color: Colors.white,
//       ),
//       headline4: TextStyle(
//         fontSize: 28,
//         color: Colors.white,
//       ),
//       subtitle2: TextStyle(fontSize: 14, color: Colors.white)),
//   appBarTheme: const AppBarTheme(
//     centerTitle: true,
//     color: Colors.transparent,
//     elevation: 0,
//     titleTextStyle: TextStyle(
//         color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
//   ),
//   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       showSelectedLabels: true,
//       showUnselectedLabels: false,
//       selectedIconTheme: IconThemeData(size: 36, color: yellow),
//       unselectedIconTheme: IconThemeData(size: 30, color: Colors.white),
//       selectedLabelStyle: TextStyle(color: yellow),
//       selectedItemColor: yellow),
// );
}
