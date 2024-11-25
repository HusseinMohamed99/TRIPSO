import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/firebase_options.dart';
import 'package:tripso/shared/bloc_observer.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/weatherCubit/weather_cubit.dart';
import 'package:tripso/shared/network/cache_helper.dart';

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
  // Initialize cache helper
  await CacheHelper.init();

  // Retrieve user ID from cache
  uId = CacheHelper.getData(key: 'uId');

  // Check if onboarding screen was viewed
  final isOnBoardingViewed = await sharedPrefHelper.isOnBoardingScreenViewed();

  final isUserLogged = await sharedPrefHelper.isUserLogged();

  // Run the app
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: TripsoApp(
        appRouter: AppRouters(sharedPrefHelper),
        isOnBoardingViewed: isOnBoardingViewed,
        isUserLogged: isUserLogged,
        sharedPrefHelper: sharedPrefHelper,
      ),
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
