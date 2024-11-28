import 'package:json_annotation/json_annotation.dart';

part 'place_model.g.dart';

@JsonSerializable()
class PlaceModel {
  String name;
  String image;
  String history;
  String location;
  List<String> timeOfDay;
  String tickets;
  String pId;
  String address;
  String rate;
  bool isPopular;

  PlaceModel({
    required this.name,
    required this.history,
    required this.timeOfDay,
    required this.image,
    required this.location,
    required this.tickets,
    required this.pId,
    required this.isPopular,
    required this.address,
    required this.rate,
  });

  /// Factory constructor for creating a new `PlaceModel` instance from JSON
  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  /// Method to convert a `PlaceModel` instance to JSON
  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);
}
