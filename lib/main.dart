import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tripso/firebase_options.dart';
import 'package:tripso/layout/layout.dart';
import 'package:tripso/mobile/screens/explore/explore.dart';
import 'package:tripso/mobile/screens/historical_city/historical_city.dart';
import 'package:tripso/mobile/screens/home/home_screen.dart';
import 'package:tripso/mobile/screens/on_boarding/on_boarding_screen.dart';
import 'package:tripso/mobile/screens/password/forget_password_screen.dart';
import 'package:tripso/mobile/screens/password/update_password_screen.dart';
import 'package:tripso/mobile/screens/plans/create_customize_plan.dart';
import 'package:tripso/mobile/screens/plans/my_plans.dart';
import 'package:tripso/mobile/screens/plans/pick_plan.dart';
import 'package:tripso/mobile/screens/plans/select_date_screen.dart';
import 'package:tripso/mobile/screens/plans/top_plans.dart';
import 'package:tripso/mobile/screens/profile/edit_profile.dart';
import 'package:tripso/mobile/screens/profile/my_profile.dart';
import 'package:tripso/mobile/screens/search/search_screen.dart';
import 'package:tripso/mobile/screens/sights/popular_sights.dart';
import 'package:tripso/mobile/screens/sights/sight_details_screen.dart';
import 'package:tripso/mobile/screens/sights/sights_screen.dart';
import 'package:tripso/mobile/screens/sign_in/sign_in_screen.dart';
import 'package:tripso/mobile/screens/sign_up/sign_up_screen.dart';
import 'package:tripso/mobile/screens/splash/splash_screen.dart';
import 'package:tripso/mobile/screens/wishlist/wishlist.dart';
import 'package:tripso/shared/bloc_observer.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/network/cache_helper.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/shared/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeApp.lightTheme,
                routes: routing(),
                initialRoute: SplashScreen.routeName,
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
