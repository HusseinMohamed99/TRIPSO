import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

PlatformAppBar defaultAppBar ()=> PlatformAppBar(
  backgroundColor: Colors.transparent,
  material: (_, __)  => MaterialAppBarData(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: 0,
  ),
 cupertino: (_, __) => CupertinoNavigationBarData(),
);


PlatformAppBar secondAppBar ()=> PlatformAppBar(
  backgroundColor: Colors.transparent,
  material: (_, __)  => MaterialAppBarData(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ),
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: 0,),
   cupertino: (_, __) => CupertinoNavigationBarData(
     brightness: Brightness.dark,
   ),

);