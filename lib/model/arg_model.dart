import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';

class ScreenArgs {
  CityModel cityModel;
  PlaceModel placeModel;

  ScreenArgs({required this.placeModel, required this.cityModel});
}
