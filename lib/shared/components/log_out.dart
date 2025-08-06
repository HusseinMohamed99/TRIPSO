import 'package:flutter/material.dart';
import 'package:tripso/mobile/screens/on_boarding/on_boarding_screen.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/network/cache_helper.dart';

void logOut(BuildContext context) async {
  final success = await CacheHelper.removeData(key: 'uId');

  if (!context.mounted) return;

  if (success) {
    navigateAndFinish(context, routeName: OnBoard.routeName);
  }
}
