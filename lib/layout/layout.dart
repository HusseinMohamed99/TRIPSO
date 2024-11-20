import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/provider/weather_provider.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home_layout';
  static Color isColor = ColorsManager.secondaryColor;

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = TripsoCubit.get(context).userModel;
        var tripsoCubit = TripsoCubit.get(context);
        return Scaffold(
          appBar: thirdAppBar(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorsManager.secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.r,
                  color: ColorsManager.blackPrimary.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6).r,
                child: GNav(
                  rippleColor: ColorsManager.primaryColor,
                  hoverColor: ColorsManager.primaryColor,
                  gap: 10.sp,
                  activeColor: ColorsManager.secondaryColor,
                  iconSize: 24.sp,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
                  duration: const Duration(microseconds: 200),
                  tabBackgroundColor: ColorsManager.primaryColor,
                  color: ColorsManager.blackPrimary,
                  tabs: [
                    GButton(
                      leading: ImageIcon(
                        color: tripsoCubit.currentIndex == 0
                            ? ColorsManager.secondaryColor
                            : ColorsManager.blackPrimary,
                        const AssetImage(
                          AssetPath.homeImage,
                        ),
                        size: 25.sp,
                      ),
                      icon: Icons.home,
                      iconSize: 25.sp,
                      text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      textStyle: TextStyle(
                          fontSize: 15.sp, color: ColorsManager.secondaryColor),
                    ),
                    GButton(
                      leading: ImageIcon(
                        color: tripsoCubit.currentIndex == 1
                            ? ColorsManager.secondaryColor
                            : ColorsManager.blackPrimary,
                        const AssetImage(
                          AssetPath.wishlistImage,
                        ),
                        size: 25.sp,
                      ),
                      icon: Icons.favorite_border,
                      iconSize: 25.sp,
                      text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      textStyle: TextStyle(
                          fontSize: 15.sp, color: ColorsManager.secondaryColor),
                    ),
                    GButton(
                      leading: ImageIcon(
                        color: tripsoCubit.currentIndex == 2
                            ? ColorsManager.secondaryColor
                            : ColorsManager.blackPrimary,
                        const AssetImage(
                          AssetPath.planImage,
                        ),
                        size: 25.sp,
                      ),
                      icon: Icons.map_outlined,
                      iconSize: 25.sp,
                      text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      textStyle: TextStyle(
                          fontSize: 15.sp, color: ColorsManager.secondaryColor),
                    ),
                    GButton(
                      icon: Icons.person,
                      leading: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ).r,
                        child: CircleAvatar(
                          radius: 15.r,
                          child: CachedNetworkImage(
                            imageUrl: userModel!.image!,
                            fit: BoxFit.fill,
                            height: 200.h,
                            width: double.infinity,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: AdaptiveIndicator(
                                os: getOs(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: AdaptiveIndicator(
                                os: getOs(),
                              ),
                            ),
                          ),
                          // backgroundImage: NetworkImage(userModel!.image),
                        ),
                      ),
                      text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      textStyle: TextStyle(
                          fontSize: 15.sp, color: ColorsManager.secondaryColor),
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
                  child: AdaptiveIndicator(
                    os: getOs(),
                  ),
                )
              : tripsoCubit.screens[tripsoCubit.currentIndex],
        );
      },
    );
  }
}
