part of './../../core/helpers/export_manager/export_manager.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsoCubit = context.read<TripsoCubit>();
    List<Widget> widgetImages = [
      Image.asset(AssetPath.gizaImage),
      Image.asset(AssetPath.dubaiImage),
      Image.asset(AssetPath.tripsoImage),
      Image.asset(AssetPath.ancient1),
      Image.asset(AssetPath.ancient2),
      Image.asset(AssetPath.ancient3),
      Image.asset(AssetPath.ancient4),
      Image.asset(AssetPath.ancient5),
      Image.asset(AssetPath.ancient6),
    ];

    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  CarouselSliderWidget(widgetImages: widgetImages)
                      .onlyPadding(bottomPadding: 30.h),
                  Positioned(
                    top: 225.h,
                    right: 10.w,
                    left: 10.w,
                    child: SearchBarItem(
                      readOnly: true,
                      function: () {
                        context.pushNamed(Routes.searchScreen);
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 8).r,
                      sliver: DisplayGridCities(cubit: tripsoCubit),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DisplayGridCities extends StatelessWidget {
  const DisplayGridCities({super.key, required this.cubit});

  final TripsoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0.w,
        mainAxisSpacing: 2.h,
        childAspectRatio: 1.h / 1.2.h,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GridCitiesItem(
            cityModel: cubit.cities[index],
          );
        },
        childCount: cubit.cities.length,
      ),
    );
  }
}

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required this.widgetImages,
  });

  final List<Widget> widgetImages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CarouselSlider(
          items: widgetImages,
          options: CarouselOptions(
            height: context.height * 0.36,
            enlargeCenterPage: false,
            viewportFraction: 2.0,
            autoPlay: true,
            autoPlayCurve: Curves.decelerate,
          ),
        ),
        LayerImage(
          height: context.height * 0.36,
          width: context.width,
          borderRadius: BorderRadius.circular(0),
        ),
        Positioned(
          bottom: 30.h,
          left: 15.w,
          right: 15.w,
          child: Text(
            "Let's plan your next adventure!",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.headlineSmall?.copyWith(
              color: ColorsManager.whiteColor,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
        Positioned(
          top: 30.h,
          right: 15.w,
          child: IconButton(
            iconSize: 24.sp,
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: ColorsManager.primaryColor,
            ),
            onPressed: () {
              logOut(context);
            },
            icon: Icon(
              Icons.logout_outlined,
              color: ColorsManager.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
