import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tripso/mobile/screens/historical_city/historical_city.dart';
import 'package:tripso/mobile/screens/plans/all_plans.dart';
import 'package:tripso/mobile/screens/search/search_screen.dart';
import 'package:tripso/mobile/screens/sights/popular_sights.dart';
import 'package:tripso/mobile/screens/sights/sights_screen.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/model/weather_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';
import 'package:tripso/shared/widget/grid_item.dart';
import 'package:tripso/shared/widget/plans_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String routeName = 'ExploreScreen';

  @override
  Widget build(BuildContext context) {
    ScreenArgs screenArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    WeatherModel weatherData;
    weatherData = Provider.of<WeatherProvider>(context).weatherData!;
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CityDetails(screenArgs: screenArgs, weatherData: weatherData),
              Space(height: 10.h, width: 0.w),
              RowWidget(
                screenArgs: screenArgs,
                cityModel: screenArgs.cityModel,
                placeModel: screenArgs.placeModel,
              ),
              PopularSightsWidget(
                  cityModel: screenArgs.cityModel,
                  placeModel: screenArgs.placeModel),
              Space(height: 20.h, width: 0.w),
              const TopPlansWidget(),
              // const AllPlansButton(),
            ],
          ),
        );
      },
    );
  }
}

class CityDetails extends StatelessWidget {
  const CityDetails({
    Key? key,
    required this.screenArgs,
    required this.weatherData,
  }) : super(key: key);

  final ScreenArgs screenArgs;
  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(20).r,
                  bottomRight: const Radius.circular(20).r,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: screenArgs.cityModel.image,
                fit: BoxFit.cover,
                height: 400.h,
                width: double.infinity,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                      child: AdaptiveIndicator(
                        os: getOs(),
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(
                  FontAwesomeIcons.info,
                  size: 24.sp,
                ),
              ),
            ),
            LayerImage(
              height: 200.h,
              width: double.infinity,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
          ],
        ),
        Positioned(
          top: 10.sp,
          left: 10.sp,
          child: Card(
            elevation: 2,
            color: Colors.black.withOpacity(0.5),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const StadiumBorder(
              side: BorderSide(
                color: ThemeApp.secondaryColor,
              ),
            ),
            child: IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  pop(context);
                  cubit.currentIndex = 0;
                }
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeApp.secondaryColor,
              ),
            ),
          ),
        ),
        Positioned(
            top: 10.sp,
            right: 10.sp,
            child: Card(
              elevation: 2,
              color: Colors.black.withOpacity(0.5),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: ThemeApp.secondaryColor,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    routeName: SearchScreen.routeName,
                  );
                },
                icon: const ImageIcon(
                  AssetImage(
                    AssetPath.searchImage,
                  ),
                  color: ThemeApp.secondaryColor,
                ),
              ),
            )),
        Column(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                weatherData.getImage(),
              ),
            ),
            Text(
              screenArgs.cityModel.name,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
            Text(
              weatherData.weatherStateName,
              style: TextStyle(
                color: ThemeApp.secondaryColor,
                fontSize: 20.sp,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Space(height: 10.h, width: 0.w),
            Text(
              '${weatherData.temp.toInt().toString()}°C',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
            Text(
              '${weatherData.minTemp.toInt().toString()}°C / ${weatherData.maxTemp.toInt().toString()}°C',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
    required this.screenArgs,
    required this.cityModel,
    required this.placeModel,
  }) : super(key: key);

  final ScreenArgs screenArgs;

  final CityModel cityModel;
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20).r,
      ),
      elevation: 2,
      margin: const EdgeInsets.all(10).r,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        alignment: Alignment.center,
        height: 122.h,
        width: double.infinity,
        padding: const EdgeInsets.all(10).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        routeName: HistoricalCity.routeName,
                        arguments: CityModel(
                          history: screenArgs.cityModel.history,
                          name: screenArgs.cityModel.name,
                          cId: screenArgs.cityModel.cId,
                          country: screenArgs.cityModel.country,
                          image: screenArgs.cityModel.image,
                          isPopular: screenArgs.cityModel.isPopular,
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(19).r,
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(216, 119, 119, 0.15),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(19).r),
                      ),
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 28.sp,
                          color: const Color.fromARGB(255, 216, 119, 119),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Historical',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        routeName: AllPlansScreen.routeName,
                      );
                    },
                    borderRadius: BorderRadius.circular(19).r,
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(105, 155, 247, 0.15),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(19).r),
                      ),
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.flag,
                          size: 28.sp,
                          color: const Color.fromARGB(255, 105, 155, 247),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Customize Plans',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      TripsoCubit.get(context).getDataPlaces(cityModel.cId);
                      TripsoCubit.get(context).getDataForCity(cityModel.cId);
                      navigateTo(
                        context,
                        routeName: SightsScreen.routeName,
                        arguments: ScreenArgs(
                          cityModel: cityModel,
                          placeModel: placeModel,
                        ),
                      );
                      debugPrint('City ID = ${cityModel.cId}');
                    },
                    borderRadius: BorderRadius.circular(19).r,
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(133, 84, 150, 0.15),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(19).r),
                      ),
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 28.sp,
                          color: const Color.fromARGB(255, 133, 84, 150),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Sights',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularSightsWidget extends StatelessWidget {
  const PopularSightsWidget({
    Key? key,
    required this.cityModel,
    required this.placeModel,
  }) : super(key: key);

  final CityModel cityModel;
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: () async {
                TripsoCubit.get(context).getPopularPlace(cityModel.cId);
                TripsoCubit.get(context).getDataPlaces(cityModel.cId);
                TripsoCubit.get(context).getDataForCity(cityModel.cId);
                navigateTo(
                  context,
                  routeName: PopularSightsScreen.routeName,
                  arguments: ScreenArgs(
                    cityModel: cityModel,
                    placeModel: placeModel,
                  ),
                );
                debugPrint('City ID = ${cityModel.cId}');
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 16).r,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Popular Sights',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: ThemeApp.primaryColor,
                            ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 24.sp,
                        color: ThemeApp.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CarouselSlider(
              items: List.generate(
                  cubit.popularPlace.length,
                  (index) => GridItemSights(cityModel,
                      placeModel: cubit.popularPlace[index])),
              options: CarouselOptions(
                height: 270.h,
                enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: .7,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TopPlansWidget extends StatelessWidget {
  const TopPlansWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            navigateTo(context, routeName: AllPlansScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16, top: 5).r,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    'Top Plans',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: ThemeApp.primaryColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 24.sp,
                    color: ThemeApp.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 220.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return topPlansItem(context, cubit.city[index]);
            },
            separatorBuilder: (context, _) {
              return Space(height: 0.h, width: 0.w);
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
