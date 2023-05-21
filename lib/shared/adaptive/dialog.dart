import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/styles/theme.dart';

class MyDialog {
  static void showLoadingDialog(
    BuildContext context,
    String message, {
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        if (Platform.operatingSystem == 'android') {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                Space(width: 15.w, height: 0.h),
                Text(
                  message,
                  style: GoogleFonts.roboto(
                    textStyle: GoogleFonts.roboto(
                      color: ThemeApp.blackPrimary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          );
        }

        return CupertinoAlertDialog(
          content: Row(
            children: [
              const CupertinoActivityIndicator(),
              Space(width: 15.w, height: 0.h),
              Text(
                message,
                style: GoogleFonts.roboto(
                  textStyle: GoogleFonts.roboto(
                    color: ThemeApp.blackPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static void showMessage(
    BuildContext context,
    String message, {
    bool isDismissible = true,
    String? posActionTitle,
    Function? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            if (posAction != null) {
              posAction();
            }
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Text(
            posActionTitle,
            style: GoogleFonts.roboto(fontSize: 15.sp),
          )));
    }
    if (negActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            if (negAction != null) {
              negAction();
            }
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Text(
            negActionTitle,
            style: GoogleFonts.roboto(fontSize: 15.sp),
          ),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        if (Platform.operatingSystem == 'android') {
          return AlertDialog(
            content: Text(
              message,
              style: GoogleFonts.roboto(
                textStyle: GoogleFonts.roboto(
                  color: ThemeApp.blackPrimary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: actions,
          );
        }

        return CupertinoAlertDialog(
          content: Text(
            message,
            style: GoogleFonts.roboto(
              textStyle: GoogleFonts.roboto(
                color: ThemeApp.blackPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          actions: actions,
        );
      },
      barrierDismissible: false,
    );
  }

  static void hideDialog(context) {
    pop(context);
  }

  static void showAlertDialog(
    BuildContext context,
    Widget widget, {
    bool isDismissible = true,
    String? posActionTitle,
    Function? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            if (posAction != null) {
              posAction();
            }
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Text(
            posActionTitle,
            style: GoogleFonts.roboto(fontSize: 15.sp),
          )));
    }
    if (negActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            if (negAction != null) {
              negAction();
            }
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Text(
            negActionTitle,
            style: GoogleFonts.roboto(fontSize: 15.sp),
          ),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        if (Platform.operatingSystem == 'android') {
          return AlertDialog(
            content: widget,
            actions: actions,
          );
        }

        return CupertinoAlertDialog(
          content: widget,
          actions: actions,
        );
      },
      barrierDismissible: false,
    );
  }
}
