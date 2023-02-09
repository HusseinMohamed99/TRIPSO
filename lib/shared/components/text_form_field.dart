import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/styles/colors.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {required this.context,
      required this.controller,
      required this.keyboardType,
      required this.validate,
      required this.hint,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscuringCharacter,
      this.style,
      this.color,
      this.focusNode,
      this.isClickable,
      this.isPassword,
      this.decoration,
      this.suffix,
      this.suffixPressed,
      this.prefix,
      Key? key})
      : super(key: key);
  final BuildContext context;
  final FocusNode? focusNode;
  final Color? color;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validate;
  final String? hint;
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      style: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        color: secondaryColor,
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
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
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
        fillColor: color,
        filled: true,
        prefixIcon: Icon(
          prefix,
          color: secondaryColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                  color: secondaryColor,
                ),
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: secondaryColor.withOpacity(0.8),
          height: 1.h,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: secondaryColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red, fontSize: 16.sp),
      ),
    );
  }
}