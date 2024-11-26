part of './../helpers/export_manager/export_manager.dart';

class AppRouters {
  final SharedPrefHelper sharedPrefHelper;

  AppRouters(this.sharedPrefHelper);
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

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
      case Routes.citiesScreen:
        return MaterialPageRoute(
          builder: (_) => CitiesScreen(),
        );
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => HomeLayout(),
        );
    }
    return null;
  }
}
