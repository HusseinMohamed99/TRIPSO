import 'package:flutter/material.dart';

class LayerImage extends StatelessWidget {
   const LayerImage({this.borderRadius,this.width, this.height, Key? key}) : super(key: key);
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: height ?? 155,
      width: width ?? 270,
      decoration:  BoxDecoration(
        borderRadius: borderRadius?? const BorderRadius.all(
          Radius.circular(20),
        ),
        color: const Color.fromRGBO(0, 0, 0, 0.3),
      ),
    );
  }
}
