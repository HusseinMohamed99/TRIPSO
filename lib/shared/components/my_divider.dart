import 'package:flutter/material.dart';

Widget myDivider({Color? color}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    width: double.infinity,
    height: 1.0,
    color: color ?? Colors.grey,
  );
}
