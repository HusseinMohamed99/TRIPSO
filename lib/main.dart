import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/desktop/desktop_screen.dart';
import 'package:tripso/firebase_options.dart';
import 'package:tripso/layout/layout.dart';
import 'package:tripso/mobile/screens/all_plans/all_plans.dart';
import 'package:tripso/mobile/screens/description/description.dart';
import 'package:tripso/mobile/screens/explore/explore.dart';
import 'package:tripso/mobile/screens/home/home_screen.dart';
import 'package:tripso/mobile/screens/my_plan/my_plans.dart';
import 'package:tripso/mobile/screens/on_boarding/on_boarding_screen.dart';
import 'package:tripso/mobile/screens/password/forget_password_screen.dart';
import 'package:tripso/mobile/screens/password/update_password_screen.dart';
import 'package:tripso/mobile/screens/profile/my_profile.dart';
import 'package:tripso/mobile/screens/search/search_screen.dart';
import 'package:tripso/mobile/screens/sights/sights.dart';
import 'package:tripso/mobile/screens/sign_in/sign_in_screen.dart';
import 'package:tripso/mobile/screens/sign_up/sign_up_screen.dart';
import 'package:tripso/mobile/screens/top_plans/top_plans.dart';
import 'package:tripso/mobile/screens/wishlist/wishlist.dart';
import 'package:tripso/shared/bloc_observer.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/network/cache_helper.dart';
import 'package:tripso/shared/styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  debugPrint('*** User ID == $uId ***');

  Widget widget;
  if (uId != null) {
    widget = const HomeScreen();
  } else {
    widget = const OnBoard();
  }

  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TripsoCubit()
              ..getUserData()
              ..getCityData()
              ..getData()),
      ],
      child: BlocConsumer<TripsoCubit, TripsoStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorSchemeSeed: primaryColor,
                useMaterial3: true,
              ),
              home: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                if (kDebugMode) {
                  print(constraints.minWidth.toInt());
                  print(constraints.minHeight.toInt());
                }
                if (constraints.minWidth.toInt() <= 500 &&
                    constraints.minHeight.toInt() <= 900) {
                  return startWidget;
                }
                return const DesktopScreen();
              }),
              routes: {
                OnBoard.routeName: (_) => const OnBoard(),
                HomeScreen.routeName: (_) => const HomeScreen(),
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
                AllPlansScreen.routeName: (_) => const AllPlansScreen(),
                DescriptionScreen.routeName: (_) => const DescriptionScreen(),
                SightsScreen.routeName: (_) => const SightsScreen(),
                DesktopScreen.routeName: (_) => const DesktopScreen(),
              },
              initialRoute: '/',
            );
          }),
    );
  }
}
