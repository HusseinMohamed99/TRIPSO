import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/core/styles/theme.dart';
import 'package:tripso/features/historical_city/historical_city.dart';
import 'package:tripso/features/plans/create_customize_plan.dart';
import 'package:tripso/features/search/search_screen.dart';
import 'package:tripso/features/sights/popular_sights.dart';
import 'package:tripso/features/sights/sights_screen.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/model/weather_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/shared/widget/grid_item.dart';
import 'package:tripso/shared/widget/plans_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
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
              RowWidget(
                screenArgs: screenArgs,
                cityModel: screenArgs.cityModel,
                placeModel: screenArgs.placeModel,
                bestPLanModel: screenArgs.bestPLanModel,
              ),
              PopularSightsWidget(
                cityModel: screenArgs.cityModel,
                placeModel: screenArgs.placeModel,
                bestPLanModel: screenArgs.bestPLanModel,
              ),
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
    super.key,
    required this.screenArgs,
    required this.weatherData,
  });

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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ).r,
              ),
              child: CachedNetworkImage(
                imageUrl: screenArgs.cityModel.image,
                fit: BoxFit.cover,
                height: 400.h,
                width: double.infinity,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: AdaptiveIndicator(os: getOs()),
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
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ).r,
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
              icon: Icon(
                Icons.arrow_back,
                color: ThemeApp.secondaryColor,
                size: 24.sp,
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
              child: Image(
                image: NetworkImage('https:${weatherData.image}'),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              screenArgs.cityModel.name,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
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
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: ThemeApp.secondaryColor,
                  ),
            ),
            Text(
              '${weatherData.minTemp.toInt().toString()}°C / ${weatherData.maxTemp.toInt().toString()}°C',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
    super.key,
    required this.screenArgs,
    required this.cityModel,
    required this.placeModel,
    required this.bestPLanModel,
  });

  final ScreenArgs screenArgs;

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

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
        height: 115.h,
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
                          Icons.book_outlined,
                          size: 28.sp,
                          color: const Color.fromARGB(255, 216, 119, 119),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Historical',
                    style: Theme.of(context).textTheme.titleLarge,
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
                        routeName: CreateCustomizePlan.routeName,
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
                          Icons.dashboard_customize_outlined,
                          size: 28.sp,
                          color: const Color.fromARGB(255, 105, 155, 247),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Customize Plans',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
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
                          bestPLanModel: bestPLanModel,
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
                    style: Theme.of(context).textTheme.titleLarge,
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
    super.key,
    required this.cityModel,
    required this.placeModel,
    required this.bestPLanModel,
  });

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Sights',
                    style: GoogleFonts.roboto(
                      fontSize: 19.sp,
                      color: ThemeApp.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                          bestPLanModel: bestPLanModel,
                        ),
                      );
                      debugPrint('City ID = ${cityModel.cId}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Row(
                        children: [
                          const Text(
                            'See More',
                            style: TextStyle(
                              color: ThemeApp.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0.sp,
                            color: ThemeApp.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: List.generate(
                  cubit.popularPlace.length,
                  (index) => GridItemSights(cityModel, bestPLanModel,
                      placeModel: cubit.popularPlace[index])),
              options: CarouselOptions(
                height: 227.h,
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Plans',
                    style: GoogleFonts.roboto(
                      fontSize: 19.sp,
                      color: ThemeApp.primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Row(
                      children: [
                        const Text(
                          'See More',
                          style: TextStyle(
                            color: ThemeApp.primaryColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0.sp,
                          color: ThemeApp.primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TopPlanItem(
                    cityModel: cubit.cityModel!,
                    placeModel: cubit.placeModel!,
                    bestPLanModel: cubit.bestPlan[index],
                  );
                },
                itemCount: cubit.bestPlan.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
