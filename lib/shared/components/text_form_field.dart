import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {required this.context,
      required this.controller,
      required this.keyboardType,
      required this.validate,
      this.hint,
      this.label,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscuringCharacter,
      this.style,
      this.color,
      this.borderSideColor,
      this.prefixColor,
      this.styleColor,
      this.focusNode,
      this.isClickable,
      this.isPassword,
      this.decoration,
      this.suffix,
      this.suffixPressed,
      this.prefix,
      this.maxLength,
      super.key});
  final BuildContext context;
  final FocusNode? focusNode;
  final Color? color;
  final Color? borderSideColor;
  final Color? styleColor;
  final Color? prefixColor;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validate;
  final String? hint;
  final String? label;
  final dynamic onTap;
  final dynamic onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? isPassword;
  final bool? isClickable;
  final InputDecoration? decoration;
  final IconData? suffix;
  final IconData? prefix;
  final Function? suffixPressed;
  final TextStyle? style;
  final String? obscuringCharacter;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      style: context.labelLarge!.copyWith(
        color: ColorsManager.blackPrimary,
      ),
      maxLines: 1,
      minLines: 1,
      obscuringCharacter: obscuringCharacter ?? '*',
      controller: controller,
      validator: validate,
      enabled: isClickable ?? true,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: isPassword ?? false,
      keyboardType: keyboardType,
      autofocus: false,
      cursorColor: ColorsManager.primaryColor,
      cursorErrorColor: ColorsManager.redColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 20).r,
        fillColor: color,
        filled: true,
        prefixIcon: Icon(
          prefix,
          color: prefixColor ?? ColorsManager.whiteColor,
          size: 24.sp,
        ).allPadding(vPadding: 6, hPadding: 10),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                  color: ColorsManager.whiteColor,
                  size: 24.sp,
                ),
              ).allPadding(vPadding: 6, hPadding: 10)
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(12.0).r,
          ),
          borderSide: BorderSide(
            color: ColorsManager.blackPrimary,
          ),
        ),
        hintText: hint,
        hintStyle: context.labelLarge!.copyWith(
          color: ColorsManager.whiteColor,
        ),
        labelText: label,
        labelStyle: context.labelLarge!.copyWith(
          color: ColorsManager.whiteColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(12.0).r,
          ),
          borderSide: BorderSide(
            color: borderSideColor ?? ColorsManager.whiteColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(12.0).r,
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(12.0).r,
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
      ),
    );
  }
}
