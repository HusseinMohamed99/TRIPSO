import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tripso/mobile/screens/search/search_screen.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/log_out.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/search_bar.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';
import 'package:tripso/shared/widget/grid_city_items.dart';

class CitiesScreen extends StatefulWidget {
  static const String routeName = 'CitiesScreen';

  const CitiesScreen({Key? key}) : super(key: key);

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  dynamic dropdownValue = 'All Countries';

  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            checkInternet();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tripsoCubit = TripsoCubit.get(context).userModel;
        return Scaffold(
          appBar: thirdAppBar(),
          body: cubit.city.isEmpty
              ? Center(
                  child: AdaptiveIndicator(
                    os: getOs(),
                  ),
                )
              : SingleChildScrollView(
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
                                        bottomRight:
                                            const Radius.circular(20).r,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w, bottom: 50.h),
                                      child: Text(
                                        'Where do you\nwant to go ?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              color: ThemeApp.secondaryColor,
                                            ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10.h,
                                      left: 10.w,
                                      child: CircleAvatar(
                                        maxRadius: 23.r,
                                        minRadius: 23.r,
                                        child: CircleAvatar(
                                          maxRadius: 20.r,
                                          minRadius: 20.r,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(75).r,
                                            child: CachedNetworkImage(
                                              imageUrl: tripsoCubit!.image!,
                                              fit: BoxFit.fill,
                                              height: 200.h,
                                              width: double.infinity,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      Center(
                                                child: AdaptiveIndicator(
                                                  os: getOs(),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Center(
                                                child: AdaptiveIndicator(
                                                  os: getOs(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // backgroundImage: NetworkImage(tripsoCubit!.image),
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
                                            color: ThemeApp.primaryColor,
                                          ),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'Log Out',
                                            style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              color: ThemeApp.secondaryColor,
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
                                gridCitiesItem(context, cubit.placeModel!,
                                    cubit.bestPLanModel!),
                              if (dropdownValue == 'Egypt')
                                gridEGItem(context, cubit.placeModel!,
                                    cubit.bestPLanModel!),
                              if (dropdownValue == 'Italy')
                                gridITItem(context, cubit.placeModel!,
                                    cubit.bestPLanModel!),
                              if (dropdownValue == 'France')
                                gridFRItem(context, cubit.placeModel!,
                                    cubit.bestPLanModel!),
                              if (dropdownValue == 'UAE')
                                gridUAEItem(context, cubit.placeModel!,
                                    cubit.bestPLanModel!),
                              if (dropdownValue == 'Popular')
                                gridPopularItem(context, cubit.placeModel!,
                                    cubit.bestPLanModel!),
                            ],
                          ),
                          Positioned(
                            top: 225.h,
                            right: 10.w,
                            left: 10.w,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SearchBar(
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
                                        color: ThemeApp.secondaryColor,
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

  checkInternet() {
    MyDialog.showMessage(
      context,
      'Please check your internet connectivity',
      posActionTitle: 'OK',
      posAction: () async {
        Navigator.pop(context, 'Cancel');
        setState(() => isAlertSet = false);
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          checkInternet();
          setState(() => isAlertSet = true);
        }
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
          cubit.city.length,
          (index) => GridCitiesItem(
                placeModel,
                bestPLanModel,
                cityModel: cubit.city[index],
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
