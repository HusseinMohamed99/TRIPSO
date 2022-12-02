import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar defaultAppBar() => AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 0,
    );

AppBar secondAppBar() => AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 0,
    );