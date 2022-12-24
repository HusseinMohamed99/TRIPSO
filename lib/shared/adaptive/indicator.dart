import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripso/shared/styles/colors.dart';

class AdaptiveIndicator extends StatelessWidget {
  final String os;

  const AdaptiveIndicator({required this.os, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (os == 'android') {
      return const CircularProgressIndicator(
        color: primaryColor,
      );
    }

    return const CupertinoActivityIndicator();
  }
}
