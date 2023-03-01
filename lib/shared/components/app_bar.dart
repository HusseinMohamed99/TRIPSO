import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/styles/theme.dart';

PreferredSizeWidget secondaryAppBar() => AppBar(
  backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ThemeApp.secondaryColor,
        systemNavigationBarColor: ThemeApp.secondaryColor,
        systemNavigationBarDividerColor: ThemeApp.secondaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 0,
    );

PreferredSizeWidget thirdAppBar() => AppBar(
  backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ThemeApp.secondaryColor,
        systemNavigationBarColor: ThemeApp.secondaryColor,
        systemNavigationBarDividerColor: ThemeApp.secondaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 0,
    );

PreferredSizeWidget primaryAppBar({
  required String title,
  required Function() function,
  required Widget iconData,
  Color? titleColor,
  Color? iconColor,
  double? fontSizeTitle,
  FontWeight? fontWeightTitle,
  List<Widget>? actions,
}) =>
    AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ThemeApp.blackPrimary,
        systemNavigationBarColor: ThemeApp.blackPrimary,
        systemNavigationBarDividerColor: ThemeApp.blackPrimary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 1,
      centerTitle: false,
      leading: IconButton(
        onPressed: () {
          function();
        },
        icon: iconData,
        color: iconColor ?? Colors.black,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
            color: titleColor ?? Colors.black,
            fontSize: fontSizeTitle ?? 20.sp,
            fontWeight: fontWeightTitle ?? FontWeight.w700,
        ),
      ),
      actions: actions,
    );