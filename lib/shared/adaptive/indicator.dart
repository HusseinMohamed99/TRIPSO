import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';

class AdaptiveIndicator extends StatelessWidget {
  final String os;

  const AdaptiveIndicator({required this.os, super.key});

  @override
  Widget build(BuildContext context) {
    if (os == 'android') {
      return const CircularProgressIndicator(
        color: ColorsManager.primaryColor,
      );
    }

    return const CupertinoActivityIndicator();
  }
}
