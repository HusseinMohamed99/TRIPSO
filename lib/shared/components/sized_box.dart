import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Space extends StatelessWidget {
  final double width;
  final double height;

  const Space({required this.height, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
    );
  }
}
