import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tripso/layout/layout.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/model/weather_model.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/shared/service/weather_service.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/styles/colors.dart';

class GridCitiesItem extends StatelessWidget {
  const GridCitiesItem(
    this.placeModel, {
    Key? key,
    required this.cityModel,
  }) : super(key: key);

  final CityModel cityModel;
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        TripsoCubit.get(context).getUserData();
        TripsoCubit.get(context).getDataPlaces(cityModel.cId);
        TripsoCubit.get(context).getDataForCity(cityModel.cId);
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(cityModel: cityModel, placeModel: placeModel),
        );

        debugPrint('City ID = ${cityModel.cId}');
        WeatherService service = WeatherService();
        WeatherModel? weather =
            await service.getWeather(cityName: cityModel.name);
        Provider.of<WeatherProvider>(context, listen: false).cityName =
            cityModel.name;
        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cityModel.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            LayerImage(
              width: 200.w,
              height: 210.h.h,
            ),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: secondaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridEGItem extends StatelessWidget {
  const GridEGItem(
    this.placeModel, {
    Key? key,
    required this.cityModel,
  }) : super(key: key);

  final CityModel cityModel;
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        TripsoCubit.get(context).getUserData();
        TripsoCubit.get(context).getDataPlaces(cityModel.cId);
        TripsoCubit.get(context).getDataForCity(cityModel.cId);
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(cityModel: cityModel, placeModel: placeModel),
        );

        debugPrint('City ID = ${cityModel.cId}');
        WeatherService service = WeatherService();
        WeatherModel? weather =
            await service.getWeather(cityName: cityModel.name);
        Provider.of<WeatherProvider>(context, listen: false).cityName =
            cityModel.name;
        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cityModel.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            LayerImage(
              width: 200.w,
              height: 210.h.h,
            ),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: secondaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridITItem extends StatelessWidget {
  const GridITItem(
    this.placeModel, {
    Key? key,
    required this.cityModel,
  }) : super(key: key);

  final CityModel cityModel;
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        TripsoCubit.get(context).getUserData();
        TripsoCubit.get(context).getDataPlaces(cityModel.cId);
        TripsoCubit.get(context).getDataForCity(cityModel.cId);
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(cityModel: cityModel, placeModel: placeModel),
        );

        debugPrint('City ID = ${cityModel.cId}');
        WeatherService service = WeatherService();
        WeatherModel? weather =
            await service.getWeather(cityName: cityModel.name);
        Provider.of<WeatherProvider>(context, listen: false).cityName =
            cityModel.name;
        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cityModel.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            LayerImage(
              width: 200.w,
              height: 210.h,
            ),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: secondaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridUAEItem extends StatelessWidget {
  const GridUAEItem(
    this.placeModel, {
    Key? key,
    required this.cityModel,
  }) : super(key: key);

  final CityModel cityModel;
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        TripsoCubit.get(context).getUserData();
        TripsoCubit.get(context).getDataPlaces(cityModel.cId);
        TripsoCubit.get(context).getDataForCity(cityModel.cId);
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(cityModel: cityModel, placeModel: placeModel),
        );

        debugPrint('City ID = ${cityModel.cId}');
        WeatherService service = WeatherService();
        WeatherModel? weather =
            await service.getWeather(cityName: cityModel.name);
        Provider.of<WeatherProvider>(context, listen: false).cityName =
            cityModel.name;
        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cityModel.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            LayerImage(
              width: 200.w,
              height: 210.h,
            ),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: secondaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridFRItem extends StatelessWidget {
  const GridFRItem(
    this.placeModel, {
    Key? key,
    required this.cityModel,
  }) : super(key: key);

  final CityModel cityModel;
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        TripsoCubit.get(context).getUserData();
        TripsoCubit.get(context).getDataPlaces(cityModel.cId);
        TripsoCubit.get(context).getDataForCity(cityModel.cId);
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(cityModel: cityModel, placeModel: placeModel),
        );

        debugPrint('City ID = ${cityModel.cId}');
        WeatherService service = WeatherService();
        WeatherModel? weather =
            await service.getWeather(cityName: cityModel.name);
        Provider.of<WeatherProvider>(context, listen: false).cityName =
            cityModel.name;
        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cityModel.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            LayerImage(
              width: 200.w,
              height: 210.h,
            ),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: secondaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
