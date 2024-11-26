part of './../core/helpers/export_manager/export_manager.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home_layout';
  static Color isColor = ColorsManager.whiteColor;

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = TripsoCubit.get(context).userModel;
        var tripsoCubit = TripsoCubit.get(context);
        return Scaffold(
          appBar: secondaryAppBar(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
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
                  activeColor: ColorsManager.whiteColor,
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
                            ? ColorsManager.whiteColor
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
                          fontSize: 15.sp, color: ColorsManager.whiteColor),
                    ),
                    GButton(
                      leading: ImageIcon(
                        color: tripsoCubit.currentIndex == 1
                            ? ColorsManager.whiteColor
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
                          fontSize: 15.sp, color: ColorsManager.whiteColor),
                    ),
                    GButton(
                      leading: ImageIcon(
                        color: tripsoCubit.currentIndex == 2
                            ? ColorsManager.whiteColor
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
                          fontSize: 15.sp, color: ColorsManager.whiteColor),
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
                            imageUrl: userModel!.image,
                            fit: BoxFit.fill,
                            height: 200.h,
                            width: double.infinity,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: AdaptiveIndicator(
                                os: '',
                              ),
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: AdaptiveIndicator(
                                os: '',
                              ),
                            ),
                          ),
                          // backgroundImage: NetworkImage(userModel!.image),
                        ),
                      ),
                      text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      textStyle: TextStyle(
                          fontSize: 15.sp, color: ColorsManager.whiteColor),
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
                    os: '',
                  ),
                )
              : tripsoCubit.screens[tripsoCubit.currentIndex],
        );
      },
    );
  }
}
