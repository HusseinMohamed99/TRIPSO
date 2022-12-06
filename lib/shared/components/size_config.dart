import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width.toInt() as double?;
    screenHeight = MediaQuery.of(context).size.height.toInt() as double?;
    orientation = MediaQuery.of(context).orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;
    debugPrint('this is the default size $defaultSize');
    debugPrint('this is the screenHeight  $screenHeight');
    debugPrint('this is the screenWidth $screenWidth');
  }
}