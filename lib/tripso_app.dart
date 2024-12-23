part of './core/helpers/export_manager/export_manager.dart';

class TripsoApp extends StatelessWidget {
  const TripsoApp({
    super.key,
    required this.appRouter,
    required this.isOnBoardingViewed,
    required this.sharedPrefHelper,
    required this.isUserLogged,
  });
  final AppRouters appRouter;
  final bool isOnBoardingViewed;
  final bool isUserLogged;
  final SharedPrefHelper sharedPrefHelper;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        SystemChrome.setPreferredOrientations(
          [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ],
        );
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: MaterialApp(
            // Using "navigatorKey.currentState?.pushNamed(route, arguments: arguments);"
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Tripso',
            theme: buildLightTheme(context),
            darkTheme: buildLightTheme(context),
            themeMode: ThemeMode.light,
            initialRoute: _getInitialRoute(),
            onGenerateRoute: AppRouters(sharedPrefHelper).generateRoute,
          ),
        );
      },
    );
  }

  // Determines the initial route based on the onboarding and login status.
  String _getInitialRoute() {
    if (isOnBoardingViewed) {
      // If onboarding is viewed, check if the user is logged in.
      return isUserLogged
          ? Routes.destinationCitiesScreen
          : Routes.signInScreen;
    } else {
      // If onboarding is not viewed, go to the onboarding view.
      return Routes.onBoardingView;
    }
  }
}
