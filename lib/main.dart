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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  await _initializeFirebase();

  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: TripsoApp(
        appRouter: AppRouters(),
      ),
    ),
  );
}

Future<FirebaseApp> _initializeFirebase() {
  return Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> _initServices() async {
  // To fix texts being hidden bug in flutter_screenutil in release MODE.
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final sharedPrefHelper = SharedPrefHelper(sharedPreferences);
  await sharedPrefHelper.isOnBoardingScreenViewed();
  await sharedPrefHelper.isUserLogged();
}
