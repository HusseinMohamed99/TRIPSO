import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home_layout';
  static Color isColor = Colors.white;

  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = TripsoCubit.get(context).userModel!;
        var tripsoCubit = TripsoCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: thirdAppBar(),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: primaryColor,
                    hoverColor: primaryColor,
                    gap: 8,
                    activeColor: secondaryColor,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: primaryColor,
                    color: Colors.black,
                    tabs: [
                      GButton(
                        leading: ImageIcon(
                          color: tripsoCubit.currentIndex == 0
                              ? secondaryColor
                              : Colors.black,
                          const AssetImage(
                            AssetPath.homeImage,
                          ),
                        ),
                        icon: Icons.home,
                        text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      ),
                      GButton(
                        leading: ImageIcon(
                          color: tripsoCubit.currentIndex == 1
                              ? secondaryColor
                              : Colors.black,
                          const AssetImage(
                            AssetPath.wishlistImage,
                          ),
                        ),
                        icon: Icons.favorite_border,
                        text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      ),
                      GButton(
                        leading: ImageIcon(
                          color: tripsoCubit.currentIndex == 2
                              ? secondaryColor
                              : Colors.black,
                          const AssetImage(
                            AssetPath.planImage,
                          ),
                        ),
                        icon: Icons.map_outlined,
                        text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      ),
                      GButton(
                        icon: Icons.person,
                        leading: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(userModel.image),
                        ),
                        text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      ),
                    ],
                    selectedIndex: tripsoCubit.currentIndex,
                    onTabChange: (index) {
                      tripsoCubit.changeIndex(index);
                    },
                  ),
                ),
              ),
            ),
            body: Provider.of<WeatherProvider>(context).weatherData == null ||
                    tripsoCubit.city.isEmpty
                ? Center(
                    child: AdaptiveIndicator(os: getOs()),
                  )
                : tripsoCubit.screens[tripsoCubit.currentIndex],
          ),
        );
      },
    );
  }
}
