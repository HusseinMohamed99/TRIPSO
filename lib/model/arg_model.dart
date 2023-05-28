import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';

class ScreenArgs {
  CityModel cityModel;
  PlaceModel placeModel;
  BestPLanModel bestPLanModel;

  ScreenArgs(
      {required this.placeModel,
      required this.cityModel,
      required this.bestPLanModel});
}
