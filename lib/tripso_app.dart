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
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TripsoCubit()
            // ..getUserData()
            // ..getCityData()
            // ..getDataForPlace()
            // ..getITData()
            // ..getEGData()
            // ..getFRData()
            // ..getUAEData()
            // ..getPopularData()
            // ..getBestPlan(),
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
                  initialRoute: isOnBoardingViewed
                      ? Routes.signInScreen
                      : Routes.onBoardingView,
                  onGenerateRoute: AppRouters(sharedPrefHelper).generateRoute,
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
    CitiesScreen.routeName: (_) => const CitiesScreen(),
    HomeLayout.routeName: (_) => const HomeLayout(),
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
