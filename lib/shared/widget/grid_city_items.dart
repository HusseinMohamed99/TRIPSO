import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripso/layout/layout.dart';
import 'package:tripso/model/weather_model.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/shared/service/weather_service.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/styles/colors.dart';

Widget gridCitiesItem(BuildContext context, CityModel cityModel) {
  return InkWell(
    borderRadius: BorderRadius.circular(10),
    onTap: () async {
      navigateTo(context,
          routeName: HomeLayout.routeName,
          arguments: CityModel(
              name: cityModel.name,
              cId: cityModel.cId,
              image: cityModel.image));
      WeatherService service = WeatherService();
      WeatherModel? weather =
          await service.getWeather(cityName: cityModel.name);
      Provider.of<WeatherProvider>(context, listen: false).cityName =
          cityModel.name;
      Provider.of<WeatherProvider>(context, listen: false).weatherData =
          weather;
    },
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Container(
            width: 200,
            height: 190,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cityModel.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const LayerImage(
            width: 200,
            height: 190,
          ),
          Text(
            cityModel.name,
            style: Theme.of(context).textTheme.headline3?.copyWith(color:secondaryColor,),
          ),
        ],
      ),
    ),
  );
}
