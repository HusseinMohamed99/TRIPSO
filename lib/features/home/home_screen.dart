part of './../../core/helpers/export_manager/export_manager.dart';

class CitiesScreen extends StatefulWidget {
  static const String routeName = 'CitiesScreen';

  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic dropdownValue = 'All Countries';

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
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              CarouselSlider(
                                items: List.generate(widgetImages.length,
                                    (index) => widgetImages[index]),
                                options: CarouselOptions(
                                  height: 250.h,
                                  enlargeCenterPage: false,
                                  disableCenter: false,
                                  viewportFraction: 2,
                                  autoPlay: true,
                                  autoPlayCurve: Curves.decelerate,
                                ),
                              ),
                              LayerImage(
                                height: 250.h,
                                width: double.infinity,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(20).r,
                                  bottomRight: const Radius.circular(20).r,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 15.w, bottom: 50.h),
                                child: Text(
                                  'Where do you\nwant to go ?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        color: ColorsManager.whiteColor,
                                      ),
                                ),
                              ),
                              Positioned(
                                top: 15.h,
                                right: 10.w,
                                child: InkWell(
                                  onTap: () {
                                    logOut(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 60.w,
                                    height: 20.h,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10.r,
                                      ),
                                      color: ColorsManager.primaryColor,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Log Out',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        color: ColorsManager.whiteColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                        Space(height: 30.h, width: 0.w),
                        Space(height: 5.h, width: 0.w),
                        if (dropdownValue == 'All Countries')
                          gridCitiesItem(
                              context, cubit.placeModel!, cubit.bestPLanModel!),
                        if (dropdownValue == 'Egypt')
                          gridEGItem(
                              context, cubit.placeModel!, cubit.bestPLanModel!),
                        if (dropdownValue == 'Italy')
                          gridITItem(
                              context, cubit.placeModel!, cubit.bestPLanModel!),
                        if (dropdownValue == 'France')
                          gridFRItem(
                              context, cubit.placeModel!, cubit.bestPLanModel!),
                        if (dropdownValue == 'UAE')
                          gridUAEItem(
                              context, cubit.placeModel!, cubit.bestPLanModel!),
                        if (dropdownValue == 'Popular')
                          gridPopularItem(
                              context, cubit.placeModel!, cubit.bestPLanModel!),
                      ],
                    ),
                    Positioned(
                      top: 225.h,
                      right: 10.w,
                      left: 10.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: SearchBarItem(
                                readOnly: true,
                                function: () {
                                  navigateTo(
                                    context,
                                    routeName: SearchScreen.routeName,
                                  );
                                }),
                          ),
                          Card(
                            elevation: 3,
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 120.w,
                              child: DropdownButton(
                                iconSize: 20.sp,
                                underline: const Divider(
                                  color: ColorsManager.whiteColor,
                                ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                items: [
                                  'All Countries',
                                  'Egypt',
                                  'Italy',
                                  'France',
                                  'UAE',
                                  'Popular',
                                ].map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Center(
                                      child: Text(
                                        e,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                value: dropdownValue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget gridCitiesItem(BuildContext context, PlaceModel placeModel,
      BestPLanModel bestPLanModel) {
    var cubit = TripsoCubit.get(context);
    return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 2.0.w,
      mainAxisSpacing: 2.h,
      childAspectRatio: 1.h / 1.2.h,
      children: List.generate(
          3,
          (index) => GridCitiesItem(
                placeModel,
                bestPLanModel,
                cityModel: cubit.cities[index],
              )),
    );
  }

  Widget gridEGItem(BuildContext context, PlaceModel placeModel,
      BestPLanModel bestPLanModel) {
    var cubit = TripsoCubit.get(context);

    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 2.0.w,
      mainAxisSpacing: 2.h,
      childAspectRatio: 1.h / 1.2.h,
      children: List.generate(
          cubit.cityEG.length,
          (index) => GridEGItem(
                placeModel,
                bestPLanModel,
                cityModel: cubit.cityEG[index],
              )),
    );
  }

  Widget gridITItem(BuildContext context, PlaceModel placeModel,
      BestPLanModel bestPLanModel) {
    var cubit = TripsoCubit.get(context);

    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 2.0.w,
      mainAxisSpacing: 2.h,
      childAspectRatio: 1.h / 1.2.h,
      children: List.generate(
          cubit.cityIT.length,
          (index) => GridITItem(
                placeModel,
                bestPLanModel,
                cityModel: cubit.cityIT[index],
              )),
    );
  }

  Widget gridUAEItem(BuildContext context, PlaceModel placeModel,
      BestPLanModel bestPLanModel) {
    var cubit = TripsoCubit.get(context);

    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 2.0.w,
      mainAxisSpacing: 2.h,
      childAspectRatio: 1.h / 1.2.h,
      children: List.generate(
          cubit.cityUAE.length,
          (index) => GridUAEItem(
                placeModel,
                bestPLanModel,
                cityModel: cubit.cityUAE[index],
              )),
    );
  }

  Widget gridFRItem(BuildContext context, PlaceModel placeModel,
      BestPLanModel bestPLanModel) {
    var cubit = TripsoCubit.get(context);

    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 2.0.w,
      mainAxisSpacing: 2.h,
      childAspectRatio: 1.h / 1.2.h,
      children: List.generate(
          cubit.cityFR.length,
          (index) => GridFRItem(
                placeModel,
                bestPLanModel,
                cityModel: cubit.cityFR[index],
              )),
    );
  }

  Widget gridPopularItem(BuildContext context, PlaceModel placeModel,
      BestPLanModel bestPLanModel) {
    var cubit = TripsoCubit.get(context);

    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 2.0.w,
      mainAxisSpacing: 2.h,
      childAspectRatio: 1.h / 1.2.h,
      children: List.generate(
          cubit.cityPopular.length,
          (index) => GridPopularItem(
                placeModel,
                bestPLanModel,
                cityModel: cubit.cityPopular[index],
              )),
    );
  }
}
