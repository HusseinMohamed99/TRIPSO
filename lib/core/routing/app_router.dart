part of './../helpers/export_manager/export_manager.dart';

class AppRouters {
  final SharedPrefHelper sharedPrefHelper;

  AppRouters(this.sharedPrefHelper);
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.splashScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //   );
      case Routes.onBoardingView:
        return MaterialPageRoute(
          builder: (_) => OnBoard(
            sharedPrefHelper: sharedPrefHelper,
          ),
        );
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => SignInCubit(),
            child: SignInScreen(
              sharedPrefHelper: sharedPrefHelper,
            ),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: SignUpScreen(),
          ),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ForgetPasswordCubit(),
            child: ForgotPassword(),
          ),
        );
      case Routes.destinationCitiesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CitiesCubit()..fetchAllCities(),
            child: DestinationCitiesScreen(),
          ),
        );
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TripsoCubit()
              ..getUserData()
              ..fetchCityData(arguments as String)
              ..getPopularPlace(arguments)
              ..fetchBestPlans(arguments),
            child: HomeLayout(),
          ),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TripsoCubit(),
            child: SearchScreen(),
          ),
        );
    }
    return null;
  }
}
