import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({
    super.key,
    required this.function,
    this.width,
    this.height,
    this.title,
    this.iconSize,
    this.iconColor,
    this.titleColor,
    this.titleSize,
    this.styleColor,
    this.fontWeightTitle,
    this.iconData,
    this.readOnly,
  });

  final bool? readOnly;
  final Function function;
  final String? title;
  final Icon? iconData;
  final Color? titleColor;
  final Color? iconColor;
  final Color? styleColor;
  final double? iconSize;
  final double? titleSize;
  final FontWeight? fontWeightTitle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: height ?? 40.h,
        width: width ?? 294.w,
        child: TextFormField(
          readOnly: readOnly!,
          style: TextStyle(color: styleColor ?? Colors.black),
          onTap: () => function(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: styleColor ?? ColorsManager.whiteColor),
            ),
            filled: true,
            fillColor: ColorsManager.whiteColor,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: styleColor ?? ColorsManager.whiteColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: styleColor ?? ColorsManager.whiteColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: styleColor ?? ColorsManager.whiteColor),
            ),
            hintText: title ?? 'Search',
            prefixIcon: iconData ??
                Icon(
                  Icons.search,
                  color: iconColor ?? ColorsManager.primaryColor,
                  size: iconSize ?? 30.sp,
                ),
          ),
        ),
      ),
    );
  }
}
