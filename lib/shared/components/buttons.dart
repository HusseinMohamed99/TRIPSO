import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget defaultMaterialButton({
  required Function() function,
  required String text,
  double? width,
  double? height,
  double? radius,
  bool isUpperCase = false,
  Color? color,
  Function? onTap,
}) => Container(
      width: width?.w ?? 260.w,
      height: height?.h ?? 43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius?.r ?? 10.r,
        ),
        color: color,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 22.h,
        minWidth: 59.w,
        onPressed: function,
        child: FittedBox(
          child: Text(
            textAlign: TextAlign.center,
            isUpperCase ? text.toUpperCase() : text,
            style: GoogleFonts.roboto(
              fontSize: 19.sp,
              color: const Color(0xffFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );

Widget defaultButton({
  required Function() function,
  required Widget widget,
  double? width,
  double? height,
  double? radius,
  bool isUpperCase = false,
  Color? color,
  Function? onTap,
}) => Container(
      width: width?.w ?? 260.w,
      height: height?.h ?? 43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius?.r ?? 10.r,
        ),
        color: color,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 22.h,
        minWidth: 59.w,
        onPressed: function,
        child: FittedBox(
          child: widget,
        ),
      ),
    );

