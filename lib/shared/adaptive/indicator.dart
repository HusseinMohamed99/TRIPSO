import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripso/shared/styles/theme.dart';

class AdaptiveIndicator extends StatelessWidget {
  final String os;

  const AdaptiveIndicator({required this.os, super.key});

  @override
  Widget build(BuildContext context) {
    if (os == 'android') {
      return const CircularProgressIndicator(
        color: ThemeApp.primaryColor,
      );
    }

    return const CupertinoActivityIndicator();
  }
}
