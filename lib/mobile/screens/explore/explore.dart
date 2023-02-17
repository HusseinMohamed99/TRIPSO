import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:tripso/mobile/screens/sights/sights.dart';
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
              RowWidget(screenArgs: screenArgs),
              PopularSightsWidget(
                  cityModel: screenArgs.cityModel,
                  placeModel: screenArgs.placeModel),
              Space(height: 20.h, width: 0.w),
              const TopPlansWidget(),
              const AllPlansButton(),
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
                side: BorderSide(color: ThemeApp.secondaryColor)),
            child: IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  pop(context);
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
                  side: BorderSide(color: ThemeApp.secondaryColor)),
              child: IconButton(
                onPressed: () {
                  navigateTo(context, routeName: SearchScreen.routeName);
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
              radius: 25.r,
              backgroundColor: Colors.transparent,
              child: Image.asset(weatherData.getImage()),
            ),
            Space(height: 10.h, width: 0.w),
            Text(
              screenArgs.cityModel.name,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: ThemeApp.secondaryColor),
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
              '${weatherData.temp.toInt().toString()}°',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: ThemeApp.secondaryColor),
            ),
          ],
        ),
      ],
    );
  }
}

class AllPlansButton extends StatelessWidget {
  const AllPlansButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0.r,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 2.0.w, color: ThemeApp.primaryColor),
        ),
        onPressed: () {
          navigateTo(context, routeName: AllPlansScreen.routeName);
        },
        child: Container(
            width: double.infinity,
            height: 35.h,
            alignment: Alignment.center,
            child: Text(
              'All Plans',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: ThemeApp.blueColor),
            )),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
    required this.screenArgs,
  }) : super(key: key);

  final ScreenArgs screenArgs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 0).r,
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
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(19).r,
                  child: Container(
                    alignment: Alignment.center,
                    width: 70.w,
                    height: 65.h,
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
                Text('Historical',
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(context, routeName: AllPlansScreen.routeName);
                  },
                  borderRadius: BorderRadius.circular(19).r,
                  child: Container(
                    alignment: Alignment.center,
                    width: 70.w,
                    height: 65.h,
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
                Text('Customize Plans',
                    style: Theme.of(context).textTheme.headline6),
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
                      routeName: SightsScreen.routeName,
                      arguments: PlaceModel(
                        name: screenArgs.placeModel.name,
                        history: screenArgs.placeModel.history,
                        hours: screenArgs.placeModel.hours,
                        image: screenArgs.placeModel.image,
                        location: screenArgs.placeModel.location,
                        tickets: screenArgs.placeModel.tickets,
                        pId: screenArgs.placeModel.pId,
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(19).r,
                  child: Container(
                    alignment: Alignment.center,
                    width: 70.w,
                    height: 65.h,
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
                Text('Sights', style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
        ],
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 16).r,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular Sights',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            CarouselSlider(
              items: List.generate(
                cubit.place.length,
                (index) => GridItemSights(placeModel: cubit.place[index]),
              ),
              options: CarouselOptions(
                height: 408.h,
                enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: .8,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ).r,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2.0.w, color: ThemeApp.primaryColor),
                ),
                onPressed: () async {
                  TripsoCubit.get(context).getDataPlaces(cityModel.cId);
                  TripsoCubit.get(context).getDataForCity(cityModel.cId);
                  navigateTo(
                    context,
                    routeName: PopularSightsScreen.routeName,
                    arguments: ScreenArgs(
                        cityModel: cityModel, placeModel: placeModel),
                  );
                  debugPrint('City ID = ${cityModel.cId}');
                },
                child: Container(
                    width: double.infinity,
                    height: 35.h,
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'All Popular Sights',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: ThemeApp.blueColor),
                    )),
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
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 16, top: 5).r,
          child: Align(
            alignment: Alignment.centerLeft,
            child:
                Text('Top Plans', style: Theme.of(context).textTheme.headline2),
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


