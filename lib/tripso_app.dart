part of './core/helpers/export_manager/export_manager.dart';

class TripsoApp extends StatelessWidget {
  const TripsoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TripsoCubit()
            ..getUserData()
            ..getCityData()
            ..getDataForPlace()
            ..getITData()
            ..getEGData()
            ..getFRData()
            ..getUAEData()
            ..getPopularData()
            ..getBestPlan(),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(WeatherService()),
        ),
      ],
      child: BlocConsumer<TripsoCubit, TripsoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
          );
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: MaterialApp(
                  // Using "navigatorKey.currentState?.pushNamed(route, arguments: arguments);"
                  navigatorKey: navigatorKey,
                  debugShowCheckedModeBanner: false,
                  theme: buildLightTheme(context),
                  darkTheme: buildLightTheme(context),
                  themeMode: ThemeMode.light,
                  routes: routing(),
                  initialRoute: SplashScreen.routeName,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Map<String, Widget Function(BuildContext)> routing() {
  return {
    OnBoard.routeName: (_) => const OnBoard(),
    SplashScreen.routeName: (_) => const SplashScreen(),
    CitiesScreen.routeName: (_) => const CitiesScreen(),
    HomeLayout.routeName: (_) => const HomeLayout(),
    SignInScreen.routeName: (_) => const SignInScreen(),
    SignUpScreen.routeName: (_) => const SignUpScreen(),
    ForgotPassword.routeName: (_) => const ForgotPassword(),
    UpdatePassword.routeName: (_) => const UpdatePassword(),
    SearchScreen.routeName: (_) => const SearchScreen(),
    MyProfileScreen.routeName: (_) => const MyProfileScreen(),
    WishListScreen.routeName: (_) => const WishListScreen(),
    ExploreScreen.routeName: (_) => const ExploreScreen(),
    MyPlansScreen.routeName: (_) => const MyPlansScreen(),
    TopPlansScreen.routeName: (_) => const TopPlansScreen(),
    HistoricalCity.routeName: (_) => const HistoricalCity(),
    SightsScreen.routeName: (_) => const SightsScreen(),
    SightDetailsScreen.routeName: (_) => const SightDetailsScreen(),
    PopularSightsScreen.routeName: (_) => const PopularSightsScreen(),
    EditProfile.routeName: (_) => EditProfile(),
    PickPlans.routeName: (_) => const PickPlans(),
    CreateCustomizePlan.routeName: (_) => const CreateCustomizePlan(),
    SelectDateScreen.routeName: (_) => const SelectDateScreen(),
  };
}