import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';

class DefaultMaterialButton extends StatelessWidget {
  final Function() function;
  final String text;
  final BuildContext context;
  final double? width;
  final double? height;
  final double? radius;
  final bool isUpperCase;
  final Color? color;
  final Function? onTap;

  const DefaultMaterialButton({
    super.key,
    required this.function,
    required this.text,
    required this.context,
    this.width,
    this.height,
    this.radius,
    this.isUpperCase = false,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width * .9,
      height: height ?? 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10.r),
        color: color ?? ColorsManager.primaryColor,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: function,
        child: Text(
          textAlign: TextAlign.center,
          isUpperCase ? text.toUpperCase() : text,
          style: context.titleMedium!.copyWith(
            color: ColorsManager.whiteColor,
          ),
        ),
      ),
    );
  }
}

Widget defaultButton({
  required Function() function,
  required Widget widget,
  double? width,
  double? height,
  double? radius,
  bool isUpperCase = false,
  Color? color,
  Function? onTap,
}) =>
    Container(
      width: width?.w ?? 310.w,
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
