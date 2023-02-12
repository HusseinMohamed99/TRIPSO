import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayerImage extends StatelessWidget {
  const LayerImage(
      {this.child, this.borderRadius, this.width, this.height, Key? key})
      : super(key: key);
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: height ?? 155.h,
      width: width ?? 270.w,
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            const BorderRadius.all(
              Radius.circular(20),
            ),
        color: const Color.fromRGBO(0, 0, 0, 0.3),
      ),
      child: child,
    );
  }
}
