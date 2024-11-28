// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) => PlaceModel(
      name: json['name'] as String,
      history: json['history'] as String,
      timeOfDay:
          (json['timeOfDay'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
      location: json['location'] as String,
      tickets: json['tickets'] as String,
      pId: json['pId'] as String,
      isPopular: json['isPopular'] as bool,
      address: json['address'] as String,
      rate: json['rate'] as String,
    );

Map<String, dynamic> _$PlaceModelToJson(PlaceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'history': instance.history,
      'location': instance.location,
      'timeOfDay': instance.timeOfDay,
      'tickets': instance.tickets,
      'pId': instance.pId,
      'address': instance.address,
      'rate': instance.rate,
      'isPopular': instance.isPopular,
    };
