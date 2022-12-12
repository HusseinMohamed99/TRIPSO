import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/screens/desktop/desktop_screen.dart';
import 'package:tripso/screens/home/home_screen.dart';
import 'package:tripso/screens/on_boarding/on_boarding_screen.dart';
import 'package:tripso/screens/password/forget_password_screen.dart';
import 'package:tripso/screens/password/update_password_screen.dart';
import 'package:tripso/screens/sign_in/sign_in_screen.dart';
import 'package:tripso/screens/sign_up/sign_up_screen.dart';
import 'package:tripso/screens/splash/splash_screen.dart';
import 'package:tripso/shared/bloc_observer.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/colors.dart';

import 'firebase_options.dart';
import 'shared/network/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  debugPrint('*** User ID == $uId ***');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TripsoCubit()..getUserData()),
      ],
      child: BlocConsumer<TripsoCubit, TripsoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);

          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: (context, child) => ResponsiveWrapper.builder(child,
      //     maxWidth: 1200,
      //     minWidth: 392,
      //     defaultScale: true,
      //     breakpoints: const [
      //       ResponsiveBreakpoint.resize(392, name: MOBILE),
      //       ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //       ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      //     ],
      //     background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
        useMaterial3: true,
      ),
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (kDebugMode) {
          print(constraints.minWidth.toInt());
        }
        if (constraints.minWidth.toInt() <= 560) {
          return const SplashScreen();
        }
        return const DesktopScreen();
      }),
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        OnBoard.routeName: (_) => const OnBoard(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        SignInScreen.routeName: (_) => const SignInScreen(),
        SignUpScreen.routeName: (_) => const SignUpScreen(),
        ForgotPassword.routeName: (_) => const ForgotPassword(),
        UpdatePassword.routeName: (_) => const UpdatePassword(),
      },
      initialRoute: '/',
    );
  }
}
