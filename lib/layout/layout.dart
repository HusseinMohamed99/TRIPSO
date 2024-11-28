part of './../core/helpers/export_manager/export_manager.dart';

class HomeLayout extends StatelessWidget {
  static Color isColor = ColorsManager.whiteColor;

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsoCubit = context.read<TripsoCubit>();

    return BlocBuilder<TripsoCubit, TripsoStates>(
      bloc: context.read<TripsoCubit>(),
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar:
              _buildBottomNavigationBar(tripsoCubit, context: context),
          body: tripsoCubit.screens[tripsoCubit.currentIndex],
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(TripsoCubit tripsoCubit,
      {required BuildContext context}) {
    return GNav(
      rippleColor: ColorsManager.primaryColor,
      hoverColor: ColorsManager.primaryColor,
      gap: 8.sp,
      activeColor: ColorsManager.whiteColor,
      iconSize: 24.sp,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      duration: const Duration(microseconds: 200),
      tabBackgroundColor: ColorsManager.primaryColor,
      color: ColorsManager.blackPrimary,
      tabs: _buildTabs(
        tripsoCubit,
        context: context,
      ),
      selectedIndex: tripsoCubit.currentIndex,
      onTabChange: tripsoCubit.changeIndex,
    ).allPadding(
      hPadding: 6,
      vPadding: 6,
    );
  }

  List<GButton> _buildTabs(TripsoCubit tripsoCubit,
      {required BuildContext context}) {
    return [
      _buildTab(
        context: context,
        icon: Icons.home,
        imageAsset: AssetPath.homeImage,
        index: 0,
        tripsoCubit: tripsoCubit,
      ),
      _buildTab(
        context: context,
        icon: Icons.favorite_border,
        imageAsset: AssetPath.wishlistImage,
        index: 1,
        tripsoCubit: tripsoCubit,
      ),
      _buildTab(
        context: context,
        icon: Icons.map_outlined,
        imageAsset: AssetPath.planImage,
        index: 2,
        tripsoCubit: tripsoCubit,
      ),
      _buildTab(
        context: context,
        icon: Icons.person,
        imageAsset: AssetPath.userImage,
        index: 3,
        tripsoCubit: tripsoCubit,
      ),
    ];
  }

  GButton _buildTab({
    required IconData icon,
    required String imageAsset,
    required int index,
    required TripsoCubit tripsoCubit,
    required BuildContext context,
  }) {
    return GButton(
      leading: ImageIcon(
        color: tripsoCubit.currentIndex == index
            ? ColorsManager.whiteColor
            : ColorsManager.blackPrimary,
        AssetImage(imageAsset),
        size: 24.sp,
      ),
      icon: icon,
      iconSize: 24.sp,
      text: tripsoCubit.titles[tripsoCubit.currentIndex],
      textStyle: context.labelLarge?.copyWith(
        color: tripsoCubit.currentIndex == index
            ? ColorsManager.whiteColor
            : ColorsManager.blackPrimary,
      ),
    );
  }
}
