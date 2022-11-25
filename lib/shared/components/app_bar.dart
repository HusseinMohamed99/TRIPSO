import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

PlatformAppBar defaultAppBar ()=> PlatformAppBar(

  material: (context, __)  => MaterialAppBarData(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: 0,
  ),
  cupertino: (_, __) => CupertinoNavigationBarData(
    backgroundColor: Colors.transparent,
  ),

);


PlatformAppBar secondAppBar ()=> PlatformAppBar(
  material: (context, __)  => MaterialAppBarData(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: 0,
  ),
  cupertino: (_, __) => CupertinoNavigationBarData(
    backgroundColor: Colors.transparent,
  ),

);