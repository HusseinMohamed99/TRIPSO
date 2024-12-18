import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/firebase_options.dart';
import 'package:tripso/shared/bloc_observer.dart';
import 'package:tripso/shared/network/cache_helper.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services and dependencies
  await _initServices();
  final sharedPreferences = await SharedPreferences.getInstance();
  final sharedPrefHelper = SharedPrefHelper(sharedPreferences);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Activate Firebase App Check
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug, // Use Play Integrity for Android
    appleProvider: AppleProvider.debug, // Use DeviceCheck for iOS
  );
  await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);

  // // Initialize cache helper
  await CacheHelper.init();

  // // Retrieve user ID from cache
  // uId = CacheHelper.getData(key: 'uId');

  // Check if onboarding screen was viewed
  final isOnBoardingViewed = await sharedPrefHelper.isOnBoardingScreenViewed();

  final isUserLogged = await sharedPrefHelper.isUserLogged();

  // Run the app
  runApp(
    TripsoApp(
      appRouter: AppRouters(sharedPrefHelper),
      isOnBoardingViewed: isOnBoardingViewed,
      isUserLogged: isUserLogged,
      sharedPrefHelper: sharedPrefHelper,
    ),
  );
}

/// Initializes services like `ScreenUtil` and Bloc observer.
Future<void> _initServices() async {
  // Fix texts being hidden in release mode with `flutter_screenutil`
  await ScreenUtil.ensureScreenSize();

  // Set up global Bloc observer for debugging
  Bloc.observer = MyBlocObserver();

  setupGetIt();
}
