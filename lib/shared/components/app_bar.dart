import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget defaultAppBar ()=> AppBar(
  systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
  ),
  backgroundColor: Colors.transparent,
  elevation: 0,
  scrolledUnderElevation: 0,
  toolbarHeight: 0,
);


PreferredSizeWidget secondAppBar ()=> AppBar(
  systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ),
  backgroundColor: Colors.transparent,
  elevation: 0,
  scrolledUnderElevation: 0,
  toolbarHeight: 0,
);